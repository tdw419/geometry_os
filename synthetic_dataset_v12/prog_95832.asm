; DESCRIPTION: Composite: Sets a single red pixel at (115, 81) then Renders a orange disk with center (199, 59) and radius 30 then Renders a blue line between points (41, 166) and (159, 197).
; PLAN: r0=115(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=59(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x1), r11=166(y1), r12=159(x2), r13=197(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 199
LDI r6, 59
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 166
LDI r12, 159
LDI r13, 197
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
