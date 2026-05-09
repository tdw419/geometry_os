; DESCRIPTION: Renders a white line between points (475, 181) and (106, 204).
; PLAN: r0=475(x1), r1=181(y1), r2=106(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 181
LDI r2, 106
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
