; DESCRIPTION: Composite: Draws a green circle centered at (125, 70) with radius 28 then Renders a orange line between points (166, 153) and (403, 32) then Sets a single purple pixel at (231, 229).
; PLAN: r0=125(x), r1=70(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=153(y1), r7=403(x2), r8=32(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=229(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 70
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 153
LDI r7, 403
LDI r8, 32
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 229
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
