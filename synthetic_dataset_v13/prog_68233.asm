; DESCRIPTION: Composite: Places a orange 78x44 rectangle at position (250, 152) then Places a magenta circle of radius 39 at center (153, 47) then Draws a purple line from (282, 205) to (179, 149).
; PLAN: r0=250(x), r1=152(y), r2=78(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=47(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x1), r11=205(y1), r12=179(x2), r13=149(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 152
LDI r2, 78
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 47
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 205
LDI r12, 179
LDI r13, 149
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
