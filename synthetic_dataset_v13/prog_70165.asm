; DESCRIPTION: Composite: Renders a magenta line between points (329, 33) and (3, 122) then Renders a red box of size 76x49 starting at (151, 137) then Places a black circle of radius 42 at center (219, 152).
; PLAN: r0=329(x1), r1=33(y1), r2=3(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=137(y), r7=76(width), r8=49(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=152(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 33
LDI r2, 3
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 137
LDI r7, 76
LDI r8, 49
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 152
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
