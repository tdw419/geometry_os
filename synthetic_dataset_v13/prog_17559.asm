; DESCRIPTION: Composite: Renders a magenta box of size 47x48 starting at (191, 118) then Places a blue dot at position (218, 17) then Places a red line segment connecting (67, 113) to (469, 72).
; PLAN: r0=191(x), r1=118(y), r2=47(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=17(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=67(x1), r11=113(y1), r12=469(x2), r13=72(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 118
LDI r2, 47
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 17
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 67
LDI r11, 113
LDI r12, 469
LDI r13, 72
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
