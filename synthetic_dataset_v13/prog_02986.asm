; DESCRIPTION: Composite: Renders a black box of size 113x106 starting at (189, 134) then Renders a orange line between points (333, 78) and (396, 21).
; PLAN: r0=189(x), r1=134(y), r2=113(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=78(y1), r7=396(x2), r8=21(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 134
LDI r2, 113
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 78
LDI r7, 396
LDI r8, 21
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
