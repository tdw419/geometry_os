; DESCRIPTION: Composite: Draws a green line from (67, 29) to (5, 241) then Draws a purple rectangle at (142, 61) with width 66 and height 68.
; PLAN: r0=67(x1), r1=29(y1), r2=5(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=61(y), r7=66(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 29
LDI r2, 5
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 61
LDI r7, 66
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
