; DESCRIPTION: Composite: Renders a orange box of size 39x40 starting at (442, 67) then Renders a cyan line between points (324, 101) and (413, 10) then Creates a purple circular shape at (209, 170) with radius 77.
; PLAN: r0=442(x), r1=67(y), r2=39(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x1), r6=101(y1), r7=413(x2), r8=10(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=170(y), r12=77(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 442
LDI r1, 67
LDI r2, 39
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 101
LDI r7, 413
LDI r8, 10
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 170
LDI r12, 77
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
