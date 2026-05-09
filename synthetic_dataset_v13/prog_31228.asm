; DESCRIPTION: Composite: Renders a yellow box of size 88x67 starting at (228, 118) then Places a green line segment connecting (208, 60) to (23, 190) then Sets a single black pixel at (352, 116).
; PLAN: r0=228(x), r1=118(y), r2=88(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x1), r6=60(y1), r7=23(x2), r8=190(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=116(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 228
LDI r1, 118
LDI r2, 88
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 60
LDI r7, 23
LDI r8, 190
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 116
LDI r12, 0x000000
PSET r10, r11, r12
HALT
