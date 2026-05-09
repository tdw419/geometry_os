; DESCRIPTION: Composite: Places a orange 55x40 rectangle at position (84, 137) then Renders a magenta line between points (191, 250) and (193, 225) then Renders a white disk with center (103, 109) and radius 49.
; PLAN: r0=84(x), r1=137(y), r2=55(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=250(y1), r7=193(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=109(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 84
LDI r1, 137
LDI r2, 55
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 250
LDI r7, 193
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 109
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
