; DESCRIPTION: Composite: Renders a yellow line between points (357, 252) and (155, 132) then Renders a yellow disk with center (125, 194) and radius 10 then Places a white 54x64 rectangle at position (90, 168).
; PLAN: r0=357(x1), r1=252(y1), r2=155(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=194(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x), r11=168(y), r12=54(width), r13=64(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 252
LDI r2, 155
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 194
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 168
LDI r12, 54
LDI r13, 64
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
