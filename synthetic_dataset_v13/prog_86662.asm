; DESCRIPTION: Composite: Renders a green disk with center (384, 168) and radius 11 then Draws a black line from (372, 112) to (5, 155) then Places a blue 110x107 rectangle at position (74, 46).
; PLAN: r0=384(x), r1=168(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x1), r6=112(y1), r7=5(x2), r8=155(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=46(y), r12=110(width), r13=107(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 168
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 112
LDI r7, 5
LDI r8, 155
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 46
LDI r12, 110
LDI r13, 107
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
