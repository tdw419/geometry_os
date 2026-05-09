; DESCRIPTION: Composite: Places a green 56x57 rectangle at position (327, 81) then Places a orange circle of radius 79 at center (311, 168) then Places a black line segment connecting (287, 243) to (188, 68).
; PLAN: r0=327(x), r1=81(y), r2=56(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=168(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=287(x1), r11=243(y1), r12=188(x2), r13=68(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 81
LDI r2, 56
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 168
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 287
LDI r11, 243
LDI r12, 188
LDI r13, 68
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
