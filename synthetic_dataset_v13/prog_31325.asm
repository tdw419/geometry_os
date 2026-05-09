; DESCRIPTION: Composite: Renders a black line between points (101, 5) and (351, 16) then Renders a red box of size 115x53 starting at (389, 130).
; PLAN: r0=101(x1), r1=5(y1), r2=351(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=130(y), r7=115(width), r8=53(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 5
LDI r2, 351
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 130
LDI r7, 115
LDI r8, 53
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
