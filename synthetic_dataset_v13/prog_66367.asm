; DESCRIPTION: Composite: Renders a yellow disk with center (255, 130) and radius 56 then Renders a orange line between points (451, 247) and (28, 15).
; PLAN: r0=255(x), r1=130(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=247(y1), r7=28(x2), r8=15(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 130
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 247
LDI r7, 28
LDI r8, 15
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
