; DESCRIPTION: Composite: Draws a cyan rectangle at (77, 81) with width 17 and height 101 then Renders a cyan disk with center (430, 174) and radius 77 then Renders a magenta line between points (206, 229) and (323, 102).
; PLAN: r0=77(x), r1=81(y), r2=17(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=174(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=206(x1), r11=229(y1), r12=323(x2), r13=102(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 81
LDI r2, 17
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 174
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 206
LDI r11, 229
LDI r12, 323
LDI r13, 102
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
