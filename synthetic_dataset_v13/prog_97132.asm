; DESCRIPTION: Composite: Renders a black line between points (12, 56) and (184, 71) then Places a yellow 45x105 rectangle at position (28, 112) then Renders a magenta disk with center (329, 78) and radius 52.
; PLAN: r0=12(x1), r1=56(y1), r2=184(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=28(x), r6=112(y), r7=45(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x), r11=78(y), r12=52(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 12
LDI r1, 56
LDI r2, 184
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 112
LDI r7, 45
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 78
LDI r12, 52
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
