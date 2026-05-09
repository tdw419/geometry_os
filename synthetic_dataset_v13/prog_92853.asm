; DESCRIPTION: Draws a white line from (4, 10) to (189, 199).
; PLAN: r0=4(x1), r1=10(y1), r2=189(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 10
LDI r2, 189
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
