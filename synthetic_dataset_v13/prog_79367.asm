; DESCRIPTION: Composite: Sets a single black pixel at (256, 13) then Places a magenta circle of radius 59 at center (144, 84) then Places a orange line segment connecting (99, 55) to (485, 206).
; PLAN: r0=256(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=84(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x1), r11=55(y1), r12=485(x2), r13=206(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 144
LDI r6, 84
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 55
LDI r12, 485
LDI r13, 206
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
