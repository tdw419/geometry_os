; DESCRIPTION: Draws a cyan line from (450, 41) to (11, 62).
; PLAN: r0=450(x1), r1=41(y1), r2=11(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 41
LDI r2, 11
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
