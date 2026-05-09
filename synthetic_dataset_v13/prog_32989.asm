; DESCRIPTION: Composite: Draws a blue line from (132, 119) to (337, 96) then Places a magenta dot at position (459, 104) then Renders a magenta box of size 118x37 starting at (141, 186).
; PLAN: r0=132(x1), r1=119(y1), r2=337(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=104(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=186(y), r12=118(width), r13=37(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 119
LDI r2, 337
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 104
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 141
LDI r11, 186
LDI r12, 118
LDI r13, 37
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
