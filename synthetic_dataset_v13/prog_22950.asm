; DESCRIPTION: Composite: Draws a orange line from (288, 57) to (338, 35) then Renders a orange box of size 65x101 starting at (280, 36) then Places a black dot at position (429, 85).
; PLAN: r0=288(x1), r1=57(y1), r2=338(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=36(y), r7=65(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=85(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 57
LDI r2, 338
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 36
LDI r7, 65
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 85
LDI r12, 0x000000
PSET r10, r11, r12
HALT
