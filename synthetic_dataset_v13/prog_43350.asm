; DESCRIPTION: Composite: Draws a yellow line from (444, 85) to (20, 96) then Places a magenta dot at position (304, 122) then Creates a purple rectangular region at (54, 187) spanning 109 by 16 pixels.
; PLAN: r0=444(x1), r1=85(y1), r2=20(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=122(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=187(y), r12=109(width), r13=16(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 85
LDI r2, 20
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 122
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 54
LDI r11, 187
LDI r12, 109
LDI r13, 16
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
