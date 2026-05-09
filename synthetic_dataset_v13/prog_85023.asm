; DESCRIPTION: Composite: Places a blue line segment connecting (339, 201) to (36, 100) then Places a red circle of radius 20 at center (157, 121) then Renders a green box of size 82x60 starting at (304, 63).
; PLAN: r0=339(x1), r1=201(y1), r2=36(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=121(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x), r11=63(y), r12=82(width), r13=60(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 201
LDI r2, 36
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 121
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 63
LDI r12, 82
LDI r13, 60
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
