; DESCRIPTION: Renders a white line between points (502, 155) and (383, 85).
; PLAN: r0=502(x1), r1=155(y1), r2=383(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 155
LDI r2, 383
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
