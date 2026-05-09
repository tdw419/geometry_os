; DESCRIPTION: Draws a white line from (244, 89) to (76, 221).
; PLAN: r0=244(x1), r1=89(y1), r2=76(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 89
LDI r2, 76
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
