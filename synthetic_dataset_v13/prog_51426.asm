; DESCRIPTION: Composite: Places a orange line segment connecting (297, 69) to (46, 148) then Places a red dot at position (111, 167) then Renders a black box of size 46x108 starting at (18, 51).
; PLAN: r0=297(x1), r1=69(y1), r2=46(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=167(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=18(x), r11=51(y), r12=46(width), r13=108(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 69
LDI r2, 46
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 167
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 18
LDI r11, 51
LDI r12, 46
LDI r13, 108
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
