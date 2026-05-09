; DESCRIPTION: Composite: Places a blue dot at position (487, 172) then Draws a black line from (322, 15) to (1, 85) then Renders a black box of size 117x88 starting at (338, 40).
; PLAN: r0=487(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=15(y1), r7=1(x2), r8=85(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=40(y), r12=117(width), r13=88(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 15
LDI r7, 1
LDI r8, 85
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 40
LDI r12, 117
LDI r13, 88
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
