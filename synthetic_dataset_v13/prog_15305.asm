; DESCRIPTION: Renders a cyan line between points (108, 10) and (41, 153).
; PLAN: r0=108(x1), r1=10(y1), r2=41(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 10
LDI r2, 41
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
