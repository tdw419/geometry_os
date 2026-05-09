; DESCRIPTION: Renders a green line between points (82, 85) and (183, 119).
; PLAN: r0=82(x1), r1=85(y1), r2=183(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 85
LDI r2, 183
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
