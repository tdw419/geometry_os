; DESCRIPTION: Composite: Places a blue 113x65 rectangle at position (64, 4) then Draws a cyan line from (179, 214) to (342, 113) then Creates a blue circular shape at (462, 206) with radius 16.
; PLAN: r0=64(x), r1=4(y), r2=113(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x1), r6=214(y1), r7=342(x2), r8=113(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=462(x), r11=206(y), r12=16(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 4
LDI r2, 113
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 214
LDI r7, 342
LDI r8, 113
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 206
LDI r12, 16
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
