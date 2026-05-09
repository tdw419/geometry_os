; DESCRIPTION: Composite: Places a blue 10x28 rectangle at position (429, 205) then Places a yellow circle of radius 70 at center (342, 78) then Draws a purple line from (11, 150) to (199, 140).
; PLAN: r0=429(x), r1=205(y), r2=10(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=78(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x1), r11=150(y1), r12=199(x2), r13=140(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 205
LDI r2, 10
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 78
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 150
LDI r12, 199
LDI r13, 140
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
