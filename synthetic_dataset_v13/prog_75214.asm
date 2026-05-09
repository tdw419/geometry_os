; DESCRIPTION: Renders a white line between points (145, 76) and (250, 173).
; PLAN: r0=145(x1), r1=76(y1), r2=250(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 76
LDI r2, 250
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
