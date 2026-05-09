; DESCRIPTION: Composite: Places a cyan line segment connecting (374, 49) to (270, 197) then Renders a red box of size 91x55 starting at (337, 188) then Creates a red circular shape at (332, 188) with radius 53.
; PLAN: r0=374(x1), r1=49(y1), r2=270(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=188(y), r7=91(width), r8=55(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=188(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 49
LDI r2, 270
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 188
LDI r7, 91
LDI r8, 55
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 188
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
