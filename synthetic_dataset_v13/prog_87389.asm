; DESCRIPTION: Composite: Renders a black box of size 100x15 starting at (331, 68) then Draws a green line from (401, 93) to (22, 191) then Sets a single yellow pixel at (507, 68).
; PLAN: r0=331(x), r1=68(y), r2=100(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=93(y1), r7=22(x2), r8=191(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=507(x), r11=68(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 68
LDI r2, 100
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 93
LDI r7, 22
LDI r8, 191
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 68
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
