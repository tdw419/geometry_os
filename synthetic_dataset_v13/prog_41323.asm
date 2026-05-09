; DESCRIPTION: Composite: Renders a white box of size 115x41 starting at (345, 131) then Renders a purple line between points (203, 161) and (306, 166).
; PLAN: r0=345(x), r1=131(y), r2=115(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=161(y1), r7=306(x2), r8=166(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 131
LDI r2, 115
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 161
LDI r7, 306
LDI r8, 166
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
