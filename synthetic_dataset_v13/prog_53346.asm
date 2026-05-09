; DESCRIPTION: Composite: Places a magenta dot at position (104, 133) then Places a white line segment connecting (316, 86) to (128, 9) then Places a red 36x29 rectangle at position (209, 69).
; PLAN: r0=104(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=316(x1), r6=86(y1), r7=128(x2), r8=9(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=69(y), r12=36(width), r13=29(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 316
LDI r6, 86
LDI r7, 128
LDI r8, 9
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 69
LDI r12, 36
LDI r13, 29
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
