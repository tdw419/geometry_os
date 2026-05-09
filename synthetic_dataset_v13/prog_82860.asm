; DESCRIPTION: Composite: Renders a blue line between points (17, 32) and (432, 32) then Creates a purple circular shape at (125, 159) with radius 52 then Renders a green box of size 88x64 starting at (361, 146).
; PLAN: r0=17(x1), r1=32(y1), r2=432(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=159(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x), r11=146(y), r12=88(width), r13=64(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 32
LDI r2, 432
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 159
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 146
LDI r12, 88
LDI r13, 64
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
