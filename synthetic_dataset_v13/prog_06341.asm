; DESCRIPTION: Renders a green line between points (226, 184) and (286, 115).
; PLAN: r0=226(x1), r1=184(y1), r2=286(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 184
LDI r2, 286
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
