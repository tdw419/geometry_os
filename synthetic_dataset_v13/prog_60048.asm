; DESCRIPTION: Composite: Renders a green box of size 95x98 starting at (367, 96) then Renders a purple line between points (351, 122) and (84, 41).
; PLAN: r0=367(x), r1=96(y), r2=95(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x1), r6=122(y1), r7=84(x2), r8=41(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 96
LDI r2, 95
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 122
LDI r7, 84
LDI r8, 41
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
