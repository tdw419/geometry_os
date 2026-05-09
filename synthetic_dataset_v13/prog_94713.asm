; DESCRIPTION: Composite: Places a orange circle of radius 56 at center (132, 152) then Renders a blue box of size 86x80 starting at (228, 105) then Places a blue line segment connecting (416, 179) to (168, 60).
; PLAN: r0=132(x), r1=152(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=105(y), r7=86(width), r8=80(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=416(x1), r11=179(y1), r12=168(x2), r13=60(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 152
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 105
LDI r7, 86
LDI r8, 80
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 179
LDI r12, 168
LDI r13, 60
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
