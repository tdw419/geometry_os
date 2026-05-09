; DESCRIPTION: Composite: Places a magenta circle of radius 59 at center (410, 191) then Renders a green line between points (129, 73) and (84, 89) then Creates a purple rectangular region at (108, 100) spanning 88 by 45 pixels.
; PLAN: r0=410(x), r1=191(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x1), r6=73(y1), r7=84(x2), r8=89(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=100(y), r12=88(width), r13=45(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 191
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 73
LDI r7, 84
LDI r8, 89
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 100
LDI r12, 88
LDI r13, 45
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
