; DESCRIPTION: Composite: Places a red line segment connecting (377, 59) to (440, 75) then Renders a yellow disk with center (382, 156) and radius 11 then Renders a purple box of size 14x92 starting at (190, 93).
; PLAN: r0=377(x1), r1=59(y1), r2=440(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=156(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x), r11=93(y), r12=14(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 59
LDI r2, 440
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 156
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 93
LDI r12, 14
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
