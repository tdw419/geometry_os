; DESCRIPTION: Places a white line segment connecting (169, 126) to (51, 45).
; PLAN: r0=169(x1), r1=126(y1), r2=51(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 126
LDI r2, 51
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
