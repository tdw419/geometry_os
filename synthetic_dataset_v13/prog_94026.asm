; DESCRIPTION: Composite: Draws a purple circle centered at (273, 78) with radius 33 then Places a red 63x21 rectangle at position (420, 25) then Renders a yellow line between points (74, 226) and (489, 175).
; PLAN: r0=273(x), r1=78(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=25(y), r7=63(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x1), r11=226(y1), r12=489(x2), r13=175(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 78
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 25
LDI r7, 63
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 226
LDI r12, 489
LDI r13, 175
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
