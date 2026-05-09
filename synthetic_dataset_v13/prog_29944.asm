; DESCRIPTION: Composite: Renders a orange line between points (377, 166) and (396, 23) then Renders a green disk with center (419, 175) and radius 60.
; PLAN: r0=377(x1), r1=166(y1), r2=396(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=175(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 166
LDI r2, 396
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 175
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
