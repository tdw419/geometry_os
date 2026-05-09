; DESCRIPTION: Renders a green line between points (79, 144) and (462, 184).
; PLAN: r0=79(x1), r1=144(y1), r2=462(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 144
LDI r2, 462
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
