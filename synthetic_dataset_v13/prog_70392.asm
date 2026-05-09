; DESCRIPTION: Draws a white line from (349, 189) to (189, 140).
; PLAN: r0=349(x1), r1=189(y1), r2=189(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 189
LDI r2, 189
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
