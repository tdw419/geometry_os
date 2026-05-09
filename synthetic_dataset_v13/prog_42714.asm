; DESCRIPTION: Composite: Renders a white line between points (50, 101) and (332, 185) then Renders a white disk with center (127, 113) and radius 39.
; PLAN: r0=50(x1), r1=101(y1), r2=332(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=113(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 101
LDI r2, 332
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 113
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
