; DESCRIPTION: Composite: Creates a blue rectangular region at (197, 207) spanning 13 by 19 pixels then Renders a white line between points (314, 176) and (482, 106).
; PLAN: r0=197(x), r1=207(y), r2=13(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=176(y1), r7=482(x2), r8=106(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 207
LDI r2, 13
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 176
LDI r7, 482
LDI r8, 106
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
