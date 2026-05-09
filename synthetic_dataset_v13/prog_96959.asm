; DESCRIPTION: Composite: Renders a orange box of size 58x46 starting at (107, 10) then Renders a green disk with center (383, 172) and radius 78 then Draws a white line from (474, 75) to (107, 66).
; PLAN: r0=107(x), r1=10(y), r2=58(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=172(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x1), r11=75(y1), r12=107(x2), r13=66(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 10
LDI r2, 58
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 172
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 75
LDI r12, 107
LDI r13, 66
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
