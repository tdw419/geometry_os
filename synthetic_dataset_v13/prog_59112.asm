; DESCRIPTION: Composite: Creates a cyan rectangular region at (173, 203) spanning 19 by 16 pixels then Places a red line segment connecting (173, 173) to (19, 164) then Creates a green circular shape at (209, 84) with radius 26.
; PLAN: r0=173(x), r1=203(y), r2=19(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x1), r6=173(y1), r7=19(x2), r8=164(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=84(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 203
LDI r2, 19
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 173
LDI r7, 19
LDI r8, 164
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 84
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
