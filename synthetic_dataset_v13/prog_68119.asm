; DESCRIPTION: Composite: Draws a white line from (47, 36) to (485, 233) then Renders a white disk with center (246, 183) and radius 17.
; PLAN: r0=47(x1), r1=36(y1), r2=485(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=183(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 36
LDI r2, 485
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 183
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
