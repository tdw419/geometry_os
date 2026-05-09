; DESCRIPTION: Renders a white line between points (115, 127) and (247, 11).
; PLAN: r0=115(x1), r1=127(y1), r2=247(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 127
LDI r2, 247
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
