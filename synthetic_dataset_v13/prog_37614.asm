; DESCRIPTION: Composite: Creates a magenta rectangular region at (256, 26) spanning 21 by 116 pixels then Places a orange circle of radius 63 at center (369, 77) then Draws a black line from (74, 0) to (294, 158).
; PLAN: r0=256(x), r1=26(y), r2=21(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x), r6=77(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x1), r11=0(y1), r12=294(x2), r13=158(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 26
LDI r2, 21
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 77
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 0
LDI r12, 294
LDI r13, 158
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
