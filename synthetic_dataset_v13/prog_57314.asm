; DESCRIPTION: Composite: Draws a green line from (281, 251) to (325, 252) then Draws a magenta circle centered at (117, 189) with radius 32 then Places a red dot at position (256, 17).
; PLAN: r0=281(x1), r1=251(y1), r2=325(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=189(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=17(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 251
LDI r2, 325
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 189
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 17
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
