; DESCRIPTION: Draws a white line from (507, 174) to (91, 51).
; PLAN: r0=507(x1), r1=174(y1), r2=91(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 174
LDI r2, 91
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
