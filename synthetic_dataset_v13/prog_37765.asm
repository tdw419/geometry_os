; DESCRIPTION: Composite: Sets a single yellow pixel at (318, 53) then Renders a red box of size 36x100 starting at (52, 14) then Renders a black line between points (375, 158) and (304, 153).
; PLAN: r0=318(x), r1=53(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=14(y), r7=36(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x1), r11=158(y1), r12=304(x2), r13=153(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 53
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 52
LDI r6, 14
LDI r7, 36
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 158
LDI r12, 304
LDI r13, 153
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
