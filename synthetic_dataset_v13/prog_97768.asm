; DESCRIPTION: Composite: Places a orange dot at position (458, 205) then Draws a black line from (485, 135) to (50, 95) then Creates a red circular shape at (232, 56) with radius 18.
; PLAN: r0=458(x), r1=205(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=135(y1), r7=50(x2), r8=95(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=56(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 205
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 485
LDI r6, 135
LDI r7, 50
LDI r8, 95
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 56
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
