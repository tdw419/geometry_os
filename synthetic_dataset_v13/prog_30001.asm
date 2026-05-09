; DESCRIPTION: Composite: Places a magenta dot at position (390, 171) then Places a blue circle of radius 58 at center (100, 151) then Renders a yellow line between points (70, 53) and (416, 155).
; PLAN: r0=390(x), r1=171(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=151(y), r7=58(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=70(x1), r11=53(y1), r12=416(x2), r13=155(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 171
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 151
LDI r7, 58
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 70
LDI r11, 53
LDI r12, 416
LDI r13, 155
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
