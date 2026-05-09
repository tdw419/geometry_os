; DESCRIPTION: Composite: Places a green line segment connecting (503, 122) to (403, 105) then Places a green 51x78 rectangle at position (173, 105) then Creates a blue circular shape at (55, 163) with radius 36.
; PLAN: r0=503(x1), r1=122(y1), r2=403(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=105(y), r7=51(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x), r11=163(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 503
LDI r1, 122
LDI r2, 403
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 105
LDI r7, 51
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 163
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
