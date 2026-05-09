; DESCRIPTION: Composite: Places a magenta line segment connecting (333, 56) to (352, 92) then Places a yellow dot at position (7, 171) then Draws a yellow rectangle at (123, 85) with width 53 and height 112.
; PLAN: r0=333(x1), r1=56(y1), r2=352(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=171(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=85(y), r12=53(width), r13=112(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 56
LDI r2, 352
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 171
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 123
LDI r11, 85
LDI r12, 53
LDI r13, 112
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
