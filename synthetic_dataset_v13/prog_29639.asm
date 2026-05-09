; DESCRIPTION: Composite: Renders a black box of size 57x98 starting at (214, 57) then Sets a single red pixel at (0, 255) then Renders a black line between points (105, 162) and (471, 151).
; PLAN: r0=214(x), r1=57(y), r2=57(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=255(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=105(x1), r11=162(y1), r12=471(x2), r13=151(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 57
LDI r2, 57
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 255
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 105
LDI r11, 162
LDI r12, 471
LDI r13, 151
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
