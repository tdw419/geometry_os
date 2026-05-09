; DESCRIPTION: Renders a orange line between points (89, 73) and (82, 146).
; PLAN: r0=89(x1), r1=73(y1), r2=82(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 73
LDI r2, 82
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
