; DESCRIPTION: Draws a cyan line from (154, 118) to (41, 158).
; PLAN: r0=154(x1), r1=118(y1), r2=41(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 118
LDI r2, 41
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
