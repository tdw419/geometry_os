; DESCRIPTION: Composite: Places a magenta dot at position (49, 126) then Places a purple line segment connecting (98, 248) to (209, 157) then Places a red 66x66 rectangle at position (166, 100).
; PLAN: r0=49(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=98(x1), r6=248(y1), r7=209(x2), r8=157(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=100(y), r12=66(width), r13=66(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 248
LDI r7, 209
LDI r8, 157
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 100
LDI r12, 66
LDI r13, 66
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
