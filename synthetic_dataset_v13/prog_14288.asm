; DESCRIPTION: Composite: Renders a black box of size 28x64 starting at (112, 178) then Places a orange line segment connecting (9, 119) to (108, 178) then Places a red dot at position (424, 227).
; PLAN: r0=112(x), r1=178(y), r2=28(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=119(y1), r7=108(x2), r8=178(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=424(x), r11=227(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 178
LDI r2, 28
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 119
LDI r7, 108
LDI r8, 178
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 227
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
