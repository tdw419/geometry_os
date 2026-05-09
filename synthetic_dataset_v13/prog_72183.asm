; DESCRIPTION: Draws a orange line from (138, 238) to (464, 186).
; PLAN: r0=138(x1), r1=238(y1), r2=464(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 238
LDI r2, 464
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
