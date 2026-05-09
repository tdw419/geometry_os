; DESCRIPTION: Composite: Places a yellow dot at position (138, 219) then Renders a green line between points (126, 188) and (103, 100) then Draws a blue rectangle at (269, 194) with width 31 and height 57.
; PLAN: r0=138(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=126(x1), r6=188(y1), r7=103(x2), r8=100(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=194(y), r12=31(width), r13=57(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 126
LDI r6, 188
LDI r7, 103
LDI r8, 100
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 194
LDI r12, 31
LDI r13, 57
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
