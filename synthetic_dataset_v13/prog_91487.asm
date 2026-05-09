; DESCRIPTION: Composite: Renders a red line between points (18, 249) and (461, 14) then Renders a blue disk with center (279, 77) and radius 64.
; PLAN: r0=18(x1), r1=249(y1), r2=461(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=77(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 18
LDI r1, 249
LDI r2, 461
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 77
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
