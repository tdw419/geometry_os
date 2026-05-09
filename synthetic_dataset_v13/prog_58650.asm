; DESCRIPTION: Composite: Draws a blue circle centered at (93, 153) with radius 76 then Places a white line segment connecting (479, 210) to (92, 117) then Places a black 50x119 rectangle at position (70, 26).
; PLAN: r0=93(x), r1=153(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=210(y1), r7=92(x2), r8=117(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=26(y), r12=50(width), r13=119(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 153
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 210
LDI r7, 92
LDI r8, 117
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 26
LDI r12, 50
LDI r13, 119
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
