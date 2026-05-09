; DESCRIPTION: Composite: Places a magenta line segment connecting (92, 177) to (371, 114) then Places a red dot at position (383, 227) then Draws a blue rectangle at (243, 59) with width 69 and height 73.
; PLAN: r0=92(x1), r1=177(y1), r2=371(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=227(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=59(y), r12=69(width), r13=73(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 177
LDI r2, 371
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 227
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 243
LDI r11, 59
LDI r12, 69
LDI r13, 73
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
