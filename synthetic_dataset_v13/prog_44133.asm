; DESCRIPTION: Composite: Places a magenta line segment connecting (326, 125) to (109, 33) then Draws a yellow circle centered at (72, 111) with radius 32 then Creates a magenta rectangular region at (99, 148) spanning 39 by 88 pixels.
; PLAN: r0=326(x1), r1=125(y1), r2=109(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=111(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=148(y), r12=39(width), r13=88(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 125
LDI r2, 109
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 111
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 148
LDI r12, 39
LDI r13, 88
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
