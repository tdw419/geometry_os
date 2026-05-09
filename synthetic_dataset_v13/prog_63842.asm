; DESCRIPTION: Renders a white line between points (484, 24) and (383, 233).
; PLAN: r0=484(x1), r1=24(y1), r2=383(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 24
LDI r2, 383
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
