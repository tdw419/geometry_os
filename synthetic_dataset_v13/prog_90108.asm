; DESCRIPTION: Composite: Draws a yellow rectangle at (229, 174) with width 39 and height 21 then Creates a cyan circular shape at (74, 77) with radius 43 then Renders a red line between points (455, 194) and (150, 150).
; PLAN: r0=229(x), r1=174(y), r2=39(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=77(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=455(x1), r11=194(y1), r12=150(x2), r13=150(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 174
LDI r2, 39
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 77
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 455
LDI r11, 194
LDI r12, 150
LDI r13, 150
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
