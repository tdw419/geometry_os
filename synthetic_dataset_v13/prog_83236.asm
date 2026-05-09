; DESCRIPTION: Composite: Places a purple dot at position (482, 68) then Draws a red line from (367, 2) to (121, 86) then Draws a orange circle centered at (254, 72) with radius 46.
; PLAN: r0=482(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=2(y1), r7=121(x2), r8=86(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=72(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 2
LDI r7, 121
LDI r8, 86
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 72
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
