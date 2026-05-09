; DESCRIPTION: Composite: Places a red line segment connecting (62, 37) to (12, 214) then Places a blue circle of radius 48 at center (424, 83) then Draws a cyan rectangle at (210, 8) with width 39 and height 89.
; PLAN: r0=62(x1), r1=37(y1), r2=12(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=83(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=8(y), r12=39(width), r13=89(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 37
LDI r2, 12
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 83
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 8
LDI r12, 39
LDI r13, 89
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
