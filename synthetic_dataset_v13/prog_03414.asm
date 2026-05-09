; DESCRIPTION: Renders a orange line between points (464, 176) and (43, 171).
; PLAN: r0=464(x1), r1=176(y1), r2=43(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 176
LDI r2, 43
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
