; DESCRIPTION: Composite: Draws a magenta line from (444, 249) to (355, 222) then Draws a yellow circle centered at (280, 95) with radius 78 then Renders a white box of size 74x110 starting at (313, 86).
; PLAN: r0=444(x1), r1=249(y1), r2=355(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=95(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=86(y), r12=74(width), r13=110(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 249
LDI r2, 355
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 95
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 86
LDI r12, 74
LDI r13, 110
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
