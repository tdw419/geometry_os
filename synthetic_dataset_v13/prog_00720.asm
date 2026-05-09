; DESCRIPTION: Composite: Places a cyan line segment connecting (504, 148) to (106, 128) then Creates a black rectangular region at (87, 17) spanning 27 by 75 pixels then Places a magenta circle of radius 41 at center (157, 132).
; PLAN: r0=504(x1), r1=148(y1), r2=106(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=17(y), r7=27(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x), r11=132(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 148
LDI r2, 106
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 17
LDI r7, 27
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 132
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
