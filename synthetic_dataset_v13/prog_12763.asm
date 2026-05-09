; DESCRIPTION: Renders a green line between points (365, 188) and (476, 149).
; PLAN: r0=365(x1), r1=188(y1), r2=476(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 188
LDI r2, 476
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
