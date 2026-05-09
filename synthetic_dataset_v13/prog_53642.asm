; DESCRIPTION: Composite: Renders a white line between points (182, 31) and (29, 89) then Renders a black disk with center (288, 96) and radius 46.
; PLAN: r0=182(x1), r1=31(y1), r2=29(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=96(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 31
LDI r2, 29
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 96
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
