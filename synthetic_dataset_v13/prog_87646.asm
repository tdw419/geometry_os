; DESCRIPTION: Composite: Creates a blue circular shape at (262, 182) with radius 18 then Renders a green line between points (255, 140) and (348, 22).
; PLAN: r0=262(x), r1=182(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x1), r6=140(y1), r7=348(x2), r8=22(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 182
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 140
LDI r7, 348
LDI r8, 22
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
