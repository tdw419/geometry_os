; DESCRIPTION: Composite: Draws a magenta rectangle at (255, 16) with width 31 and height 66 then Places a white line segment connecting (141, 28) to (239, 150) then Renders a purple disk with center (308, 119) and radius 42.
; PLAN: r0=255(x), r1=16(y), r2=31(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=28(y1), r7=239(x2), r8=150(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=119(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 16
LDI r2, 31
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 28
LDI r7, 239
LDI r8, 150
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 119
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
