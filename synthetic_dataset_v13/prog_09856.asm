; DESCRIPTION: Composite: Places a orange 87x70 rectangle at position (210, 95) then Draws a yellow circle centered at (411, 196) with radius 56 then Renders a red line between points (470, 0) and (447, 37).
; PLAN: r0=210(x), r1=95(y), r2=87(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=196(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=470(x1), r11=0(y1), r12=447(x2), r13=37(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 95
LDI r2, 87
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 196
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 470
LDI r11, 0
LDI r12, 447
LDI r13, 37
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
