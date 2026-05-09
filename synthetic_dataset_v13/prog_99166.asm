; DESCRIPTION: Composite: Places a orange 53x119 rectangle at position (389, 7) then Draws a purple line from (284, 83) to (213, 130).
; PLAN: r0=389(x), r1=7(y), r2=53(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=83(y1), r7=213(x2), r8=130(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 7
LDI r2, 53
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 83
LDI r7, 213
LDI r8, 130
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
