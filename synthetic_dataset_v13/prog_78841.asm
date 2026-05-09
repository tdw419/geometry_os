; DESCRIPTION: Composite: Renders a black line between points (422, 114) and (355, 176) then Renders a black disk with center (263, 108) and radius 53.
; PLAN: r0=422(x1), r1=114(y1), r2=355(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=108(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 114
LDI r2, 355
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 108
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
