; DESCRIPTION: Composite: Places a orange line segment connecting (500, 194) to (142, 141) then Places a blue dot at position (499, 72) then Renders a black box of size 85x16 starting at (421, 199).
; PLAN: r0=500(x1), r1=194(y1), r2=142(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=72(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=421(x), r11=199(y), r12=85(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 194
LDI r2, 142
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 72
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 421
LDI r11, 199
LDI r12, 85
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
