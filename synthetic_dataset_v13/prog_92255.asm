; DESCRIPTION: Composite: Renders a yellow line between points (509, 66) and (329, 204) then Places a magenta 99x10 rectangle at position (256, 176) then Renders a black disk with center (160, 125) and radius 33.
; PLAN: r0=509(x1), r1=66(y1), r2=329(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=176(y), r7=99(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x), r11=125(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 509
LDI r1, 66
LDI r2, 329
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 176
LDI r7, 99
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 125
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
