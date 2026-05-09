; DESCRIPTION: Renders a green line between points (226, 8) and (433, 189).
; PLAN: r0=226(x1), r1=8(y1), r2=433(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 8
LDI r2, 433
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
