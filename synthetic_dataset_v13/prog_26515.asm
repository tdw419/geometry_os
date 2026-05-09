; DESCRIPTION: Composite: Renders a white line between points (39, 40) and (451, 77) then Draws a orange circle centered at (228, 214) with radius 11.
; PLAN: r0=39(x1), r1=40(y1), r2=451(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=214(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 40
LDI r2, 451
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 214
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
