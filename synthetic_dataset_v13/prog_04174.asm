; DESCRIPTION: Composite: Places a black 81x40 rectangle at position (132, 118) then Draws a yellow line from (205, 160) to (267, 173) then Renders a red disk with center (229, 61) and radius 60.
; PLAN: r0=132(x), r1=118(y), r2=81(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x1), r6=160(y1), r7=267(x2), r8=173(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=61(y), r12=60(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 118
LDI r2, 81
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 160
LDI r7, 267
LDI r8, 173
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 61
LDI r12, 60
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
