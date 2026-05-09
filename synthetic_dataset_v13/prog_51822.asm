; DESCRIPTION: Composite: Draws a blue line from (103, 96) to (203, 30) then Sets a single green pixel at (4, 14) then Places a orange 83x88 rectangle at position (102, 25).
; PLAN: r0=103(x1), r1=96(y1), r2=203(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=4(x), r6=14(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=102(x), r11=25(y), r12=83(width), r13=88(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 96
LDI r2, 203
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 14
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 102
LDI r11, 25
LDI r12, 83
LDI r13, 88
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
