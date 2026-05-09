; DESCRIPTION: Composite: Renders a green disk with center (63, 149) and radius 53 then Renders a orange line between points (350, 218) and (370, 69).
; PLAN: r0=63(x), r1=149(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=218(y1), r7=370(x2), r8=69(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 63
LDI r1, 149
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 218
LDI r7, 370
LDI r8, 69
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
