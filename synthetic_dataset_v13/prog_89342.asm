; DESCRIPTION: Renders a white line between points (307, 81) and (112, 140).
; PLAN: r0=307(x1), r1=81(y1), r2=112(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 81
LDI r2, 112
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
