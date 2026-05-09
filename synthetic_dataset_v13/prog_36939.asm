; DESCRIPTION: Composite: Draws a orange line from (265, 221) to (53, 99) then Renders a red box of size 25x56 starting at (406, 175).
; PLAN: r0=265(x1), r1=221(y1), r2=53(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=175(y), r7=25(width), r8=56(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 221
LDI r2, 53
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 175
LDI r7, 25
LDI r8, 56
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
