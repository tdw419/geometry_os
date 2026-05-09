; DESCRIPTION: Renders a white line between points (44, 133) and (15, 195).
; PLAN: r0=44(x1), r1=133(y1), r2=15(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 133
LDI r2, 15
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
