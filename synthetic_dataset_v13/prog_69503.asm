; DESCRIPTION: Composite: Renders a orange line between points (134, 191) and (119, 162) then Renders a red box of size 118x33 starting at (88, 124) then Places a orange dot at position (33, 208).
; PLAN: r0=134(x1), r1=191(y1), r2=119(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=124(y), r7=118(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=33(x), r11=208(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 191
LDI r2, 119
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 124
LDI r7, 118
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 208
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
