; DESCRIPTION: Composite: Places a black 81x102 rectangle at position (31, 6) then Draws a orange line from (447, 192) to (37, 59) then Renders a black disk with center (450, 171) and radius 48.
; PLAN: r0=31(x), r1=6(y), r2=81(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x1), r6=192(y1), r7=37(x2), r8=59(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=450(x), r11=171(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 6
LDI r2, 81
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 192
LDI r7, 37
LDI r8, 59
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 171
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
