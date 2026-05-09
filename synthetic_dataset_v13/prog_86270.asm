; DESCRIPTION: Composite: Renders a white line between points (280, 60) and (6, 237) then Creates a white circular shape at (332, 132) with radius 14.
; PLAN: r0=280(x1), r1=60(y1), r2=6(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=132(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 60
LDI r2, 6
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 132
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
