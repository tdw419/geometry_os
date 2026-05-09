; DESCRIPTION: Composite: Draws a black rectangle at (287, 155) with width 95 and height 69 then Draws a red line from (446, 58) to (365, 28).
; PLAN: r0=287(x), r1=155(y), r2=95(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=58(y1), r7=365(x2), r8=28(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 155
LDI r2, 95
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 58
LDI r7, 365
LDI r8, 28
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
