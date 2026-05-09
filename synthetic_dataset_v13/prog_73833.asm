; DESCRIPTION: Composite: Places a red 55x41 rectangle at position (419, 118) then Draws a orange line from (73, 57) to (441, 213) then Creates a red circular shape at (480, 203) with radius 32.
; PLAN: r0=419(x), r1=118(y), r2=55(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x1), r6=57(y1), r7=441(x2), r8=213(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=480(x), r11=203(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 118
LDI r2, 55
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 57
LDI r7, 441
LDI r8, 213
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 480
LDI r11, 203
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
