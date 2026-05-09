; DESCRIPTION: Composite: Renders a blue line between points (422, 74) and (504, 113) then Creates a white circular shape at (164, 151) with radius 74.
; PLAN: r0=422(x1), r1=74(y1), r2=504(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=151(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 74
LDI r2, 504
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 151
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
