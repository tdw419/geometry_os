; DESCRIPTION: Composite: Places a red dot at position (327, 19) then Places a cyan line segment connecting (413, 217) to (315, 126) then Renders a magenta disk with center (116, 101) and radius 46.
; PLAN: r0=327(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=413(x1), r6=217(y1), r7=315(x2), r8=126(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=116(x), r11=101(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 413
LDI r6, 217
LDI r7, 315
LDI r8, 126
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 101
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
