; DESCRIPTION: Composite: Draws a cyan line from (184, 178) to (433, 109) then Places a yellow 57x75 rectangle at position (16, 49) then Places a purple circle of radius 78 at center (148, 143).
; PLAN: r0=184(x1), r1=178(y1), r2=433(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=49(y), r7=57(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x), r11=143(y), r12=78(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 184
LDI r1, 178
LDI r2, 433
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 49
LDI r7, 57
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 143
LDI r12, 78
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
