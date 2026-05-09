; DESCRIPTION: Draws a cyan line from (10, 41) to (193, 187).
; PLAN: r0=10(x1), r1=41(y1), r2=193(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 41
LDI r2, 193
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
