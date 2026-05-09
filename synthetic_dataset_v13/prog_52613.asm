; DESCRIPTION: Composite: Renders a black line between points (156, 177) and (199, 191) then Renders a blue disk with center (398, 59) and radius 51.
; PLAN: r0=156(x1), r1=177(y1), r2=199(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=59(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 177
LDI r2, 199
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 59
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
