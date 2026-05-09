; DESCRIPTION: Composite: Places a black circle of radius 36 at center (303, 187) then Draws a cyan line from (206, 59) to (110, 60) then Creates a red rectangular region at (270, 121) spanning 81 by 88 pixels.
; PLAN: r0=303(x), r1=187(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x1), r6=59(y1), r7=110(x2), r8=60(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=121(y), r12=81(width), r13=88(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 187
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 59
LDI r7, 110
LDI r8, 60
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 121
LDI r12, 81
LDI r13, 88
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
