; DESCRIPTION: Composite: Places a cyan line segment connecting (40, 159) to (303, 2) then Places a orange dot at position (173, 96) then Creates a cyan circular shape at (370, 96) with radius 55.
; PLAN: r0=40(x1), r1=159(y1), r2=303(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=96(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=96(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 159
LDI r2, 303
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 96
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 370
LDI r11, 96
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
