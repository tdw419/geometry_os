; DESCRIPTION: Draws a white line from (322, 243) to (297, 44).
; PLAN: r0=322(x1), r1=243(y1), r2=297(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 243
LDI r2, 297
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
