; DESCRIPTION: Renders a orange line between points (146, 97) and (161, 182).
; PLAN: r0=146(x1), r1=97(y1), r2=161(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 97
LDI r2, 161
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
