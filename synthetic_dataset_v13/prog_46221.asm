; DESCRIPTION: Renders a orange line between points (330, 115) and (212, 125).
; PLAN: r0=330(x1), r1=115(y1), r2=212(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 115
LDI r2, 212
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
