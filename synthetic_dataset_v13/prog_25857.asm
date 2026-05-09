; DESCRIPTION: Draws a white line from (191, 125) to (443, 112).
; PLAN: r0=191(x1), r1=125(y1), r2=443(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 125
LDI r2, 443
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
