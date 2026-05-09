; DESCRIPTION: Composite: Renders a orange line between points (415, 131) and (198, 104) then Draws a blue circle centered at (349, 50) with radius 39 then Renders a blue box of size 21x16 starting at (69, 77).
; PLAN: r0=415(x1), r1=131(y1), r2=198(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=50(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x), r11=77(y), r12=21(width), r13=16(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 131
LDI r2, 198
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 50
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 77
LDI r12, 21
LDI r13, 16
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
