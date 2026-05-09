; DESCRIPTION: Composite: Creates a red circular shape at (281, 132) with radius 79 then Draws a black rectangle at (109, 87) with width 77 and height 106 then Renders a magenta line between points (259, 20) and (462, 243).
; PLAN: r0=281(x), r1=132(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=87(y), r7=77(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x1), r11=20(y1), r12=462(x2), r13=243(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 132
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 87
LDI r7, 77
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 20
LDI r12, 462
LDI r13, 243
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
