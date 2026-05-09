; DESCRIPTION: Composite: Places a green line segment connecting (197, 16) to (403, 112) then Places a orange 67x22 rectangle at position (215, 55) then Draws a yellow circle centered at (95, 78) with radius 59.
; PLAN: r0=197(x1), r1=16(y1), r2=403(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=55(y), r7=67(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x), r11=78(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 16
LDI r2, 403
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 55
LDI r7, 67
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 78
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
