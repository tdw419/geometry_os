; DESCRIPTION: Renders a green line between points (140, 112) and (236, 168).
; PLAN: r0=140(x1), r1=112(y1), r2=236(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 112
LDI r2, 236
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
