; DESCRIPTION: Composite: Renders a green line between points (54, 59) and (48, 102) then Places a orange 113x105 rectangle at position (114, 63) then Places a purple circle of radius 29 at center (315, 109).
; PLAN: r0=54(x1), r1=59(y1), r2=48(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=63(y), r7=113(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=109(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 59
LDI r2, 48
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 63
LDI r7, 113
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 109
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
