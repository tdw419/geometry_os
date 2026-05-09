; DESCRIPTION: Composite: Places a green 86x102 rectangle at position (358, 57) then Renders a red line between points (210, 5) and (150, 89) then Draws a purple circle centered at (209, 160) with radius 70.
; PLAN: r0=358(x), r1=57(y), r2=86(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x1), r6=5(y1), r7=150(x2), r8=89(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=160(y), r12=70(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 57
LDI r2, 86
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 5
LDI r7, 150
LDI r8, 89
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 160
LDI r12, 70
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
