; DESCRIPTION: Composite: Places a red dot at position (324, 216) then Places a black 46x58 rectangle at position (460, 152) then Places a purple line segment connecting (415, 179) to (22, 7).
; PLAN: r0=324(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=152(y), r7=46(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=415(x1), r11=179(y1), r12=22(x2), r13=7(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 460
LDI r6, 152
LDI r7, 46
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 179
LDI r12, 22
LDI r13, 7
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
