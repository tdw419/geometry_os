; DESCRIPTION: Composite: Renders a magenta box of size 17x93 starting at (20, 59) then Sets a single yellow pixel at (481, 22) then Draws a magenta line from (255, 83) to (379, 140).
; PLAN: r0=20(x), r1=59(y), r2=17(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=22(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=255(x1), r11=83(y1), r12=379(x2), r13=140(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 59
LDI r2, 17
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 22
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 255
LDI r11, 83
LDI r12, 379
LDI r13, 140
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
