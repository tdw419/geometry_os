; DESCRIPTION: Composite: Places a green 31x114 rectangle at position (54, 10) then Draws a purple line from (442, 122) to (247, 250).
; PLAN: r0=54(x), r1=10(y), r2=31(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x1), r6=122(y1), r7=247(x2), r8=250(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 10
LDI r2, 31
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 122
LDI r7, 247
LDI r8, 250
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
