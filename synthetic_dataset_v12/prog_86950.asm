; DESCRIPTION: Composite: Renders a yellow disk with center (410, 80) and radius 75 then Places a orange line segment connecting (396, 108) to (280, 109).
; PLAN: r0=410(x), r1=80(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=108(y1), r7=280(x2), r8=109(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 80
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 108
LDI r7, 280
LDI r8, 109
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
