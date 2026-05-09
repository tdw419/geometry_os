; DESCRIPTION: Composite: Places a yellow line segment connecting (239, 153) to (304, 135) then Renders a blue box of size 57x29 starting at (421, 140).
; PLAN: r0=239(x1), r1=153(y1), r2=304(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=140(y), r7=57(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 153
LDI r2, 304
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 140
LDI r7, 57
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
