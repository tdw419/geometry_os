; DESCRIPTION: Composite: Renders a magenta box of size 74x49 starting at (421, 50) then Draws a red circle centered at (59, 56) with radius 39 then Places a blue line segment connecting (457, 125) to (23, 207).
; PLAN: r0=421(x), r1=50(y), r2=74(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=56(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=457(x1), r11=125(y1), r12=23(x2), r13=207(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 50
LDI r2, 74
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 56
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 457
LDI r11, 125
LDI r12, 23
LDI r13, 207
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
