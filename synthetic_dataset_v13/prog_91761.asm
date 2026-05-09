; DESCRIPTION: Composite: Renders a orange box of size 31x25 starting at (179, 51) then Renders a magenta line between points (139, 21) and (39, 41).
; PLAN: r0=179(x), r1=51(y), r2=31(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x1), r6=21(y1), r7=39(x2), r8=41(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 51
LDI r2, 31
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 21
LDI r7, 39
LDI r8, 41
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
