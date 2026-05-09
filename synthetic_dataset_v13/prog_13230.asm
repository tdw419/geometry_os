; DESCRIPTION: Composite: Renders a black box of size 55x53 starting at (190, 162) then Places a white dot at position (193, 77) then Places a red line segment connecting (187, 137) to (254, 9).
; PLAN: r0=190(x), r1=162(y), r2=55(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=77(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=187(x1), r11=137(y1), r12=254(x2), r13=9(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 162
LDI r2, 55
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 77
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 187
LDI r11, 137
LDI r12, 254
LDI r13, 9
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
