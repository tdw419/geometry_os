; DESCRIPTION: Composite: Places a blue line segment connecting (433, 226) to (91, 134) then Renders a yellow box of size 77x92 starting at (263, 163).
; PLAN: r0=433(x1), r1=226(y1), r2=91(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=163(y), r7=77(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 226
LDI r2, 91
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 163
LDI r7, 77
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
