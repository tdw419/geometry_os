; DESCRIPTION: Composite: Renders a yellow box of size 99x47 starting at (274, 123) then Places a cyan line segment connecting (252, 22) to (363, 206) then Places a orange circle of radius 19 at center (337, 48).
; PLAN: r0=274(x), r1=123(y), r2=99(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x1), r6=22(y1), r7=363(x2), r8=206(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=48(y), r12=19(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 123
LDI r2, 99
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 22
LDI r7, 363
LDI r8, 206
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 48
LDI r12, 19
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
