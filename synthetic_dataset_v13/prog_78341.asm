; DESCRIPTION: Composite: Renders a white line between points (290, 124) and (315, 79) then Draws a purple circle centered at (203, 130) with radius 71.
; PLAN: r0=290(x1), r1=124(y1), r2=315(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=130(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 124
LDI r2, 315
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 130
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
