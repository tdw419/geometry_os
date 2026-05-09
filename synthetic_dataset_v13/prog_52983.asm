; DESCRIPTION: Composite: Draws a red line from (383, 75) to (363, 178) then Renders a orange box of size 13x77 starting at (151, 159) then Places a red dot at position (105, 242).
; PLAN: r0=383(x1), r1=75(y1), r2=363(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=159(y), r7=13(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x), r11=242(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 75
LDI r2, 363
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 159
LDI r7, 13
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 242
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
