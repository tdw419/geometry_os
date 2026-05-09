; DESCRIPTION: Renders a white line between points (445, 51) and (311, 137).
; PLAN: r0=445(x1), r1=51(y1), r2=311(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 51
LDI r2, 311
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
