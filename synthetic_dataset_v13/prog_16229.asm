; DESCRIPTION: Draws a green line from (223, 185) to (342, 76).
; PLAN: r0=223(x1), r1=185(y1), r2=342(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 185
LDI r2, 342
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
