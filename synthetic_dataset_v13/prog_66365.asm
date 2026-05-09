; DESCRIPTION: Renders a white line between points (79, 187) and (46, 155).
; PLAN: r0=79(x1), r1=187(y1), r2=46(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 187
LDI r2, 46
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
