; DESCRIPTION: Draws a black line from (48, 171) to (199, 250).
; PLAN: r0=48(x1), r1=171(y1), r2=199(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 171
LDI r2, 199
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
