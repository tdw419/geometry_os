; DESCRIPTION: Composite: Places a magenta line segment connecting (270, 185) to (387, 240) then Renders a yellow box of size 86x58 starting at (216, 170).
; PLAN: r0=270(x1), r1=185(y1), r2=387(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=170(y), r7=86(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 185
LDI r2, 387
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 170
LDI r7, 86
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
