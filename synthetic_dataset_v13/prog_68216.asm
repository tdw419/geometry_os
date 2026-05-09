; DESCRIPTION: Composite: Renders a blue disk with center (349, 72) and radius 15 then Renders a red line between points (119, 148) and (377, 7) then Places a blue 78x48 rectangle at position (60, 47).
; PLAN: r0=349(x), r1=72(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x1), r6=148(y1), r7=377(x2), r8=7(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=60(x), r11=47(y), r12=78(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 72
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 148
LDI r7, 377
LDI r8, 7
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 47
LDI r12, 78
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
