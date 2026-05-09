; DESCRIPTION: Composite: Places a blue circle of radius 72 at center (258, 85) then Renders a white line between points (204, 53) and (62, 23) then Renders a red box of size 71x25 starting at (196, 71).
; PLAN: r0=258(x), r1=85(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x1), r6=53(y1), r7=62(x2), r8=23(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=71(y), r12=71(width), r13=25(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 85
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 53
LDI r7, 62
LDI r8, 23
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 71
LDI r12, 71
LDI r13, 25
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
