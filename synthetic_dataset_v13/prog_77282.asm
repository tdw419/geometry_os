; DESCRIPTION: Composite: Creates a cyan circular shape at (161, 109) with radius 55 then Places a orange line segment connecting (507, 196) to (471, 48) then Renders a orange box of size 98x17 starting at (144, 90).
; PLAN: r0=161(x), r1=109(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=196(y1), r7=471(x2), r8=48(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=144(x), r11=90(y), r12=98(width), r13=17(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 109
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 196
LDI r7, 471
LDI r8, 48
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 90
LDI r12, 98
LDI r13, 17
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
