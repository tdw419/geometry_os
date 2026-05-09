; DESCRIPTION: Composite: Places a cyan 60x88 rectangle at position (77, 136) then Renders a green line between points (202, 57) and (285, 122) then Places a blue circle of radius 53 at center (187, 78).
; PLAN: r0=77(x), r1=136(y), r2=60(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x1), r6=57(y1), r7=285(x2), r8=122(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=78(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 136
LDI r2, 60
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 57
LDI r7, 285
LDI r8, 122
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 78
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
