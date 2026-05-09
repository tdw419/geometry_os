; DESCRIPTION: Composite: Draws a yellow line from (403, 251) to (350, 145) then Creates a cyan circular shape at (260, 194) with radius 21 then Places a red dot at position (53, 160).
; PLAN: r0=403(x1), r1=251(y1), r2=350(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=194(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x), r11=160(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 251
LDI r2, 350
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 194
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 160
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
