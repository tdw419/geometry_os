; DESCRIPTION: Draws a red line from (41, 149) to (481, 253).
; PLAN: r0=41(x1), r1=149(y1), r2=481(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 149
LDI r2, 481
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
