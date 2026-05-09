; DESCRIPTION: Composite: Places a cyan line segment connecting (119, 164) to (180, 18) then Places a purple 38x59 rectangle at position (73, 155) then Draws a white circle centered at (463, 173) with radius 24.
; PLAN: r0=119(x1), r1=164(y1), r2=180(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=155(y), r7=38(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=173(y), r12=24(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 164
LDI r2, 180
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 155
LDI r7, 38
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 173
LDI r12, 24
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
