; DESCRIPTION: Renders a orange line between points (282, 146) and (426, 184).
; PLAN: r0=282(x1), r1=146(y1), r2=426(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 146
LDI r2, 426
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
