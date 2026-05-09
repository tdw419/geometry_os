; DESCRIPTION: Composite: Places a red 39x82 rectangle at position (169, 158) then Draws a purple line from (333, 17) to (2, 53).
; PLAN: r0=169(x), r1=158(y), r2=39(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=17(y1), r7=2(x2), r8=53(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 158
LDI r2, 39
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 17
LDI r7, 2
LDI r8, 53
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
