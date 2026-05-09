; DESCRIPTION: Composite: Places a magenta dot at position (485, 143) then Places a magenta 34x63 rectangle at position (407, 143) then Renders a magenta line between points (157, 248) and (101, 250).
; PLAN: r0=485(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=143(y), r7=34(width), r8=63(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x1), r11=248(y1), r12=101(x2), r13=250(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 143
LDI r7, 34
LDI r8, 63
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 248
LDI r12, 101
LDI r13, 250
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
