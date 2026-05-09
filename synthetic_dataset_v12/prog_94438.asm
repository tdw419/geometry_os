; DESCRIPTION: Composite: Renders a white line between points (450, 166) and (53, 49) then Renders a purple disk with center (112, 17) and radius 11.
; PLAN: r0=450(x1), r1=166(y1), r2=53(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=17(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 450
LDI r1, 166
LDI r2, 53
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 17
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
