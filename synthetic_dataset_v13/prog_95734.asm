; DESCRIPTION: Composite: Places a magenta 74x63 rectangle at position (416, 184) then Renders a black disk with center (342, 144) and radius 67 then Renders a white line between points (115, 220) and (363, 122).
; PLAN: r0=416(x), r1=184(y), r2=74(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=144(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x1), r11=220(y1), r12=363(x2), r13=122(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 184
LDI r2, 74
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 144
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 220
LDI r12, 363
LDI r13, 122
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
