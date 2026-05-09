; DESCRIPTION: Draws a cyan line from (212, 41) to (193, 153).
; PLAN: r0=212(x1), r1=41(y1), r2=193(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 41
LDI r2, 193
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
