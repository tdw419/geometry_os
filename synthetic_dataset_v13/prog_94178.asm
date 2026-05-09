; DESCRIPTION: Composite: Places a red circle of radius 20 at center (383, 88) then Draws a red line from (478, 148) to (345, 179) then Renders a yellow box of size 16x24 starting at (400, 166).
; PLAN: r0=383(x), r1=88(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=148(y1), r7=345(x2), r8=179(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=166(y), r12=16(width), r13=24(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 88
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 148
LDI r7, 345
LDI r8, 179
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 166
LDI r12, 16
LDI r13, 24
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
