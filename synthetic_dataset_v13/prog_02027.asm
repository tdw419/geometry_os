; DESCRIPTION: Renders a white line between points (490, 41) and (301, 127).
; PLAN: r0=490(x1), r1=41(y1), r2=301(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 41
LDI r2, 301
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
