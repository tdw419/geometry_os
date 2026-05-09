; DESCRIPTION: Composite: Places a green 36x24 rectangle at position (467, 225) then Places a orange line segment connecting (74, 113) to (197, 31) then Places a blue circle of radius 60 at center (64, 168).
; PLAN: r0=467(x), r1=225(y), r2=36(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=113(y1), r7=197(x2), r8=31(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=168(y), r12=60(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 225
LDI r2, 36
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 113
LDI r7, 197
LDI r8, 31
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 168
LDI r12, 60
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
