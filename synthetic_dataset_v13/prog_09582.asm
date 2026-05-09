; DESCRIPTION: Composite: Renders a green line between points (371, 139) and (407, 122) then Places a green 113x95 rectangle at position (204, 92) then Draws a magenta circle centered at (50, 209) with radius 43.
; PLAN: r0=371(x1), r1=139(y1), r2=407(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=92(y), r7=113(width), r8=95(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x), r11=209(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 139
LDI r2, 407
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 92
LDI r7, 113
LDI r8, 95
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 209
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
