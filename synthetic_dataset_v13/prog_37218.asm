; DESCRIPTION: Composite: Places a magenta dot at position (453, 123) then Places a purple circle of radius 33 at center (425, 119) then Renders a green line between points (101, 151) and (416, 26).
; PLAN: r0=453(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=119(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=101(x1), r11=151(y1), r12=416(x2), r13=26(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 123
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 119
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 101
LDI r11, 151
LDI r12, 416
LDI r13, 26
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
