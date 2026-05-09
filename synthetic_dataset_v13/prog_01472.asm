; DESCRIPTION: Composite: Places a magenta line segment connecting (504, 21) to (76, 84) then Places a purple dot at position (227, 72) then Renders a red box of size 62x20 starting at (319, 120).
; PLAN: r0=504(x1), r1=21(y1), r2=76(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=72(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=319(x), r11=120(y), r12=62(width), r13=20(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 21
LDI r2, 76
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 72
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 319
LDI r11, 120
LDI r12, 62
LDI r13, 20
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
