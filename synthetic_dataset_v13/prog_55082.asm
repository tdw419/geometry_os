; DESCRIPTION: Composite: Places a blue line segment connecting (314, 216) to (477, 198) then Places a red 82x107 rectangle at position (323, 67).
; PLAN: r0=314(x1), r1=216(y1), r2=477(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=67(y), r7=82(width), r8=107(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 216
LDI r2, 477
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 67
LDI r7, 82
LDI r8, 107
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
