; DESCRIPTION: Composite: Places a white line segment connecting (301, 153) to (39, 49) then Renders a black disk with center (329, 172) and radius 67 then Renders a yellow box of size 52x59 starting at (385, 25).
; PLAN: r0=301(x1), r1=153(y1), r2=39(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=172(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=25(y), r12=52(width), r13=59(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 153
LDI r2, 39
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 172
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 25
LDI r12, 52
LDI r13, 59
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
