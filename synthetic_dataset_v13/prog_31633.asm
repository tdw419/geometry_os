; DESCRIPTION: Composite: Places a black dot at position (505, 135) then Renders a cyan line between points (118, 10) and (197, 219) then Renders a blue disk with center (247, 104) and radius 33.
; PLAN: r0=505(x), r1=135(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x1), r6=10(y1), r7=197(x2), r8=219(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=104(y), r12=33(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 505
LDI r1, 135
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 10
LDI r7, 197
LDI r8, 219
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 104
LDI r12, 33
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
