; DESCRIPTION: Composite: Creates a black circular shape at (15, 111) with radius 14 then Renders a blue box of size 84x92 starting at (402, 76) then Renders a cyan line between points (205, 158) and (479, 67).
; PLAN: r0=15(x), r1=111(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=76(y), r7=84(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x1), r11=158(y1), r12=479(x2), r13=67(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 111
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 76
LDI r7, 84
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 158
LDI r12, 479
LDI r13, 67
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
