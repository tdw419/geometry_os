; DESCRIPTION: Composite: Places a blue dot at position (113, 75) then Draws a purple line from (353, 46) to (124, 246) then Renders a magenta box of size 21x101 starting at (114, 136).
; PLAN: r0=113(x), r1=75(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=353(x1), r6=46(y1), r7=124(x2), r8=246(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=136(y), r12=21(width), r13=101(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 75
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 46
LDI r7, 124
LDI r8, 246
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 136
LDI r12, 21
LDI r13, 101
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
