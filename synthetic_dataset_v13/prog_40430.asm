; DESCRIPTION: Composite: Places a white circle of radius 67 at center (253, 163) then Renders a magenta box of size 60x16 starting at (209, 144) then Renders a blue line between points (265, 117) and (232, 41).
; PLAN: r0=253(x), r1=163(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=144(y), r7=60(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x1), r11=117(y1), r12=232(x2), r13=41(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 163
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 144
LDI r7, 60
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 117
LDI r12, 232
LDI r13, 41
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
