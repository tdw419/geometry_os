; DESCRIPTION: Composite: Renders a white line between points (319, 231) and (358, 146) then Renders a red box of size 68x105 starting at (365, 41).
; PLAN: r0=319(x1), r1=231(y1), r2=358(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=41(y), r7=68(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 231
LDI r2, 358
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 41
LDI r7, 68
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
