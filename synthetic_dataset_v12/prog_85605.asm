; DESCRIPTION: Composite: Renders a orange line between points (39, 203) and (422, 85) then Places a green 88x93 rectangle at position (117, 58) then Renders a red disk with center (255, 167) and radius 70.
; PLAN: r0=39(x1), r1=203(y1), r2=422(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=58(y), r7=88(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=167(y), r12=70(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 203
LDI r2, 422
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 58
LDI r7, 88
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 167
LDI r12, 70
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
