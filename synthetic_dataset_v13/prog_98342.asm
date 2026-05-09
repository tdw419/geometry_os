; DESCRIPTION: Composite: Renders a white box of size 62x30 starting at (100, 95) then Places a green dot at position (220, 233) then Places a blue line segment connecting (216, 199) to (308, 222).
; PLAN: r0=100(x), r1=95(y), r2=62(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=233(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=216(x1), r11=199(y1), r12=308(x2), r13=222(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 95
LDI r2, 62
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 233
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 216
LDI r11, 199
LDI r12, 308
LDI r13, 222
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
