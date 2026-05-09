; DESCRIPTION: Renders a orange line between points (327, 185) and (150, 138).
; PLAN: r0=327(x1), r1=185(y1), r2=150(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 185
LDI r2, 150
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
