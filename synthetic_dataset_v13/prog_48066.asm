; DESCRIPTION: Composite: Draws a purple rectangle at (334, 131) with width 50 and height 101 then Renders a cyan line between points (300, 142) and (131, 241) then Draws a cyan circle centered at (360, 94) with radius 20.
; PLAN: r0=334(x), r1=131(y), r2=50(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x1), r6=142(y1), r7=131(x2), r8=241(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=94(y), r12=20(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 131
LDI r2, 50
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 142
LDI r7, 131
LDI r8, 241
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 94
LDI r12, 20
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
