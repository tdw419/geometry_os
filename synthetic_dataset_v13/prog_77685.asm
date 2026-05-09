; DESCRIPTION: Composite: Renders a blue box of size 113x37 starting at (23, 184) then Places a blue line segment connecting (435, 241) to (414, 173).
; PLAN: r0=23(x), r1=184(y), r2=113(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=241(y1), r7=414(x2), r8=173(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 184
LDI r2, 113
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 241
LDI r7, 414
LDI r8, 173
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
