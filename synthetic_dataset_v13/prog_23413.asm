; DESCRIPTION: Composite: Renders a cyan line between points (343, 184) and (62, 198) then Renders a black disk with center (326, 122) and radius 38 then Renders a red box of size 64x56 starting at (28, 47).
; PLAN: r0=343(x1), r1=184(y1), r2=62(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=122(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=47(y), r12=64(width), r13=56(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 184
LDI r2, 62
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 122
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 47
LDI r12, 64
LDI r13, 56
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
