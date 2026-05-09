; DESCRIPTION: Composite: Places a cyan 97x88 rectangle at position (118, 25) then Renders a red disk with center (143, 131) and radius 55 then Places a blue line segment connecting (208, 118) to (339, 88).
; PLAN: r0=118(x), r1=25(y), r2=97(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=131(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x1), r11=118(y1), r12=339(x2), r13=88(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 25
LDI r2, 97
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 131
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 118
LDI r12, 339
LDI r13, 88
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
