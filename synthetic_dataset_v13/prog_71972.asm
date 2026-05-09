; DESCRIPTION: Composite: Renders a white box of size 112x52 starting at (143, 41) then Renders a green line between points (481, 140) and (413, 236) then Creates a blue circular shape at (139, 196) with radius 55.
; PLAN: r0=143(x), r1=41(y), r2=112(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x1), r6=140(y1), r7=413(x2), r8=236(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=196(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 41
LDI r2, 112
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 140
LDI r7, 413
LDI r8, 236
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 196
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
