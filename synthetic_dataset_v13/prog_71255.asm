; DESCRIPTION: Composite: Renders a yellow disk with center (78, 162) and radius 64 then Renders a green box of size 21x49 starting at (104, 170) then Draws a cyan line from (42, 203) to (511, 44).
; PLAN: r0=78(x), r1=162(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=170(y), r7=21(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x1), r11=203(y1), r12=511(x2), r13=44(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 162
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 170
LDI r7, 21
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 203
LDI r12, 511
LDI r13, 44
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
