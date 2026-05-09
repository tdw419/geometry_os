; DESCRIPTION: Draws a cyan line from (100, 41) to (471, 54).
; PLAN: r0=100(x1), r1=41(y1), r2=471(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 41
LDI r2, 471
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
