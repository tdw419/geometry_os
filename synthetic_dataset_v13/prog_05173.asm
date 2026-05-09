; DESCRIPTION: Composite: Draws a magenta line from (328, 75) to (55, 195) then Places a red 50x21 rectangle at position (141, 231) then Places a yellow circle of radius 29 at center (103, 69).
; PLAN: r0=328(x1), r1=75(y1), r2=55(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=231(y), r7=50(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x), r11=69(y), r12=29(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 75
LDI r2, 55
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 231
LDI r7, 50
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 69
LDI r12, 29
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
