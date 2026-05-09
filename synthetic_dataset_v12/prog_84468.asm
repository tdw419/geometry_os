; DESCRIPTION: Composite: Places a yellow circle of radius 72 at center (398, 162) then Places a orange 61x99 rectangle at position (40, 30) then Renders a blue line between points (324, 173) and (8, 94).
; PLAN: r0=398(x), r1=162(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=30(y), r7=61(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x1), r11=173(y1), r12=8(x2), r13=94(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 162
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 30
LDI r7, 61
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 173
LDI r12, 8
LDI r13, 94
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
