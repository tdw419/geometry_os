; DESCRIPTION: Composite: Renders a green line between points (490, 138) and (212, 234) then Places a purple circle of radius 73 at center (320, 174) then Places a blue 115x116 rectangle at position (45, 16).
; PLAN: r0=490(x1), r1=138(y1), r2=212(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=174(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x), r11=16(y), r12=115(width), r13=116(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 138
LDI r2, 212
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 174
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 16
LDI r12, 115
LDI r13, 116
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
