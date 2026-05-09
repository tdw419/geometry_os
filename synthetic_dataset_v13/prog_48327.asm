; DESCRIPTION: Composite: Renders a yellow line between points (154, 168) and (245, 88) then Renders a red box of size 68x94 starting at (204, 80) then Places a red circle of radius 78 at center (429, 133).
; PLAN: r0=154(x1), r1=168(y1), r2=245(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=80(y), r7=68(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=133(y), r12=78(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 168
LDI r2, 245
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 80
LDI r7, 68
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 133
LDI r12, 78
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
