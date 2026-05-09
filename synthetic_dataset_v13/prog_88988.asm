; DESCRIPTION: Composite: Places a black dot at position (120, 173) then Renders a blue disk with center (177, 82) and radius 25 then Renders a black line between points (158, 167) and (199, 1).
; PLAN: r0=120(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=82(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x1), r11=167(y1), r12=199(x2), r13=1(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 177
LDI r6, 82
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 167
LDI r12, 199
LDI r13, 1
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
