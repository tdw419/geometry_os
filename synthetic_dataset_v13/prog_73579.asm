; DESCRIPTION: Composite: Renders a white line between points (485, 172) and (177, 169) then Renders a red disk with center (291, 146) and radius 29.
; PLAN: r0=485(x1), r1=172(y1), r2=177(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=146(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 485
LDI r1, 172
LDI r2, 177
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 146
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
