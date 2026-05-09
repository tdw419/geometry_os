; DESCRIPTION: Draws a white line from (250, 33) to (505, 199).
; PLAN: r0=250(x1), r1=33(y1), r2=505(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 33
LDI r2, 505
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
