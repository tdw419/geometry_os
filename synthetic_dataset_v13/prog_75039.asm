; DESCRIPTION: Renders a green line between points (148, 79) and (25, 21).
; PLAN: r0=148(x1), r1=79(y1), r2=25(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 79
LDI r2, 25
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
