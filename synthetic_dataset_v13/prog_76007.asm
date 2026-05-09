; DESCRIPTION: Composite: Renders a green disk with center (424, 74) and radius 15 then Renders a yellow line between points (218, 203) and (105, 1) then Places a white 118x114 rectangle at position (280, 108).
; PLAN: r0=424(x), r1=74(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x1), r6=203(y1), r7=105(x2), r8=1(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=108(y), r12=118(width), r13=114(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 74
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 203
LDI r7, 105
LDI r8, 1
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 108
LDI r12, 118
LDI r13, 114
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
