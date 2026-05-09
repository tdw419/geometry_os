; DESCRIPTION: Composite: Renders a red box of size 71x119 starting at (101, 9) then Draws a red line from (221, 198) to (238, 69).
; PLAN: r0=101(x), r1=9(y), r2=71(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x1), r6=198(y1), r7=238(x2), r8=69(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 9
LDI r2, 71
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 198
LDI r7, 238
LDI r8, 69
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
