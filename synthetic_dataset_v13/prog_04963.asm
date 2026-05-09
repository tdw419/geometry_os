; DESCRIPTION: Composite: Places a green line segment connecting (188, 52) to (445, 118) then Creates a blue circular shape at (232, 121) with radius 42 then Renders a red box of size 117x107 starting at (61, 7).
; PLAN: r0=188(x1), r1=52(y1), r2=445(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=121(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=61(x), r11=7(y), r12=117(width), r13=107(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 52
LDI r2, 445
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 121
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 61
LDI r11, 7
LDI r12, 117
LDI r13, 107
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
