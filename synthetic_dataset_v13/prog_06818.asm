; DESCRIPTION: Composite: Draws a yellow circle centered at (182, 63) with radius 45 then Renders a white box of size 83x67 starting at (84, 28) then Places a purple line segment connecting (377, 57) to (199, 185).
; PLAN: r0=182(x), r1=63(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=28(y), r7=83(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x1), r11=57(y1), r12=199(x2), r13=185(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 63
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 28
LDI r7, 83
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 57
LDI r12, 199
LDI r13, 185
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
