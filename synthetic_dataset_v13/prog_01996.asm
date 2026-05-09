; DESCRIPTION: Renders a orange line between points (461, 121) and (150, 16).
; PLAN: r0=461(x1), r1=121(y1), r2=150(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 121
LDI r2, 150
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
