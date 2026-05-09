; DESCRIPTION: Composite: Sets a single purple pixel at (453, 148) then Places a black 88x115 rectangle at position (23, 115) then Draws a magenta line from (164, 14) to (157, 241).
; PLAN: r0=453(x), r1=148(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=115(y), r7=88(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x1), r11=14(y1), r12=157(x2), r13=241(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 148
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 23
LDI r6, 115
LDI r7, 88
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 14
LDI r12, 157
LDI r13, 241
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
