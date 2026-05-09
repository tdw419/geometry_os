; DESCRIPTION: Renders a white line between points (247, 202) and (226, 105).
; PLAN: r0=247(x1), r1=202(y1), r2=226(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 202
LDI r2, 226
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
