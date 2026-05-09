; DESCRIPTION: Composite: Renders a red box of size 54x27 starting at (385, 32) then Renders a white line between points (364, 24) and (160, 196) then Places a orange circle of radius 78 at center (137, 154).
; PLAN: r0=385(x), r1=32(y), r2=54(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=24(y1), r7=160(x2), r8=196(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=154(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 32
LDI r2, 54
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 24
LDI r7, 160
LDI r8, 196
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 154
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
