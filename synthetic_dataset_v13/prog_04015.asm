; DESCRIPTION: Renders a white line between points (79, 90) and (322, 202).
; PLAN: r0=79(x1), r1=90(y1), r2=322(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 90
LDI r2, 322
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
