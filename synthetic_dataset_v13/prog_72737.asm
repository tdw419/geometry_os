; DESCRIPTION: Composite: Draws a purple line from (24, 60) to (98, 185) then Draws a red rectangle at (67, 168) with width 53 and height 23.
; PLAN: r0=24(x1), r1=60(y1), r2=98(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=168(y), r7=53(width), r8=23(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 60
LDI r2, 98
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 168
LDI r7, 53
LDI r8, 23
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
