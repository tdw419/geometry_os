; DESCRIPTION: Composite: Renders a yellow line between points (269, 64) and (150, 250) then Renders a orange disk with center (254, 132) and radius 78 then Renders a green box of size 90x115 starting at (74, 51).
; PLAN: r0=269(x1), r1=64(y1), r2=150(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=132(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=51(y), r12=90(width), r13=115(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 64
LDI r2, 150
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 132
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 51
LDI r12, 90
LDI r13, 115
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
