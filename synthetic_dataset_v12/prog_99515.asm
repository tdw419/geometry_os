; DESCRIPTION: Composite: Draws a white rectangle at (136, 77) with width 36 and height 67 then Places a magenta circle of radius 68 at center (208, 81) then Places a magenta line segment connecting (204, 83) to (120, 115).
; PLAN: r0=136(x), r1=77(y), r2=36(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=81(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x1), r11=83(y1), r12=120(x2), r13=115(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 77
LDI r2, 36
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 81
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 83
LDI r12, 120
LDI r13, 115
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
