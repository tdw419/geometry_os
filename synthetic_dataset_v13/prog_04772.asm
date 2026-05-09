; DESCRIPTION: Draws a white line from (122, 131) to (45, 76).
; PLAN: r0=122(x1), r1=131(y1), r2=45(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 131
LDI r2, 45
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
