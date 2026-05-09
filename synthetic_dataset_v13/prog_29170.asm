; DESCRIPTION: Composite: Renders a black line between points (191, 77) and (289, 208) then Renders a magenta disk with center (193, 69) and radius 36.
; PLAN: r0=191(x1), r1=77(y1), r2=289(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=69(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 77
LDI r2, 289
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 69
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
