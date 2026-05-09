; DESCRIPTION: Composite: Places a cyan line segment connecting (359, 83) to (344, 217) then Renders a black box of size 30x112 starting at (41, 57).
; PLAN: r0=359(x1), r1=83(y1), r2=344(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=57(y), r7=30(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 83
LDI r2, 344
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 57
LDI r7, 30
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
