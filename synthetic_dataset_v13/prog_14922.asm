; DESCRIPTION: Renders a green line between points (140, 112) and (477, 236).
; PLAN: r0=140(x1), r1=112(y1), r2=477(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 112
LDI r2, 477
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
