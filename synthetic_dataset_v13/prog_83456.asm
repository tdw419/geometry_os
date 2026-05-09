; DESCRIPTION: Composite: Draws a white line from (292, 207) to (116, 8) then Places a blue 29x70 rectangle at position (428, 26) then Places a magenta circle of radius 52 at center (200, 65).
; PLAN: r0=292(x1), r1=207(y1), r2=116(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=26(y), r7=29(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x), r11=65(y), r12=52(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 207
LDI r2, 116
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 26
LDI r7, 29
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 65
LDI r12, 52
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
