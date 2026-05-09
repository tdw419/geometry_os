; DESCRIPTION: Composite: Places a red 35x42 rectangle at position (25, 30) then Places a blue line segment connecting (403, 76) to (361, 77) then Renders a yellow disk with center (76, 122) and radius 69.
; PLAN: r0=25(x), r1=30(y), r2=35(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=76(y1), r7=361(x2), r8=77(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=122(y), r12=69(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 30
LDI r2, 35
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 76
LDI r7, 361
LDI r8, 77
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 122
LDI r12, 69
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
