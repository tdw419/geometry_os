; DESCRIPTION: Composite: Places a purple dot at position (480, 121) then Renders a red box of size 67x60 starting at (431, 15) then Draws a purple line from (341, 161) to (469, 154).
; PLAN: r0=480(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=15(y), r7=67(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=341(x1), r11=161(y1), r12=469(x2), r13=154(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 15
LDI r7, 67
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 161
LDI r12, 469
LDI r13, 154
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
