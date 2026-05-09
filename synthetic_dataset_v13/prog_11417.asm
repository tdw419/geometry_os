; DESCRIPTION: Composite: Draws a green line from (298, 198) to (178, 117) then Draws a red circle centered at (365, 128) with radius 76 then Places a green dot at position (154, 202).
; PLAN: r0=298(x1), r1=198(y1), r2=178(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=128(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=202(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 198
LDI r2, 178
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 128
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 202
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
