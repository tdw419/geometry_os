; DESCRIPTION: Composite: Renders a magenta box of size 116x70 starting at (24, 120) then Draws a orange line from (77, 74) to (175, 132) then Draws a blue circle centered at (79, 159) with radius 36.
; PLAN: r0=24(x), r1=120(y), r2=116(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x1), r6=74(y1), r7=175(x2), r8=132(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=159(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 120
LDI r2, 116
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 74
LDI r7, 175
LDI r8, 132
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 159
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
