; DESCRIPTION: Composite: Places a cyan circle of radius 69 at center (87, 169) then Renders a blue box of size 76x39 starting at (237, 191) then Places a orange line segment connecting (311, 172) to (492, 210).
; PLAN: r0=87(x), r1=169(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=191(y), r7=76(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x1), r11=172(y1), r12=492(x2), r13=210(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 169
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 191
LDI r7, 76
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 172
LDI r12, 492
LDI r13, 210
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
