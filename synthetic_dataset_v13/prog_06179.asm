; DESCRIPTION: Composite: Places a magenta line segment connecting (139, 3) to (19, 237) then Places a green circle of radius 40 at center (251, 94) then Renders a red box of size 71x81 starting at (357, 87).
; PLAN: r0=139(x1), r1=3(y1), r2=19(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=94(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x), r11=87(y), r12=71(width), r13=81(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 3
LDI r2, 19
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 94
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 87
LDI r12, 71
LDI r13, 81
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
