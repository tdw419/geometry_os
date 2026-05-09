; DESCRIPTION: Draws a cyan line from (41, 6) to (210, 84).
; PLAN: r0=41(x1), r1=6(y1), r2=210(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 6
LDI r2, 210
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
