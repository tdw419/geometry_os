; DESCRIPTION: Renders a white line between points (60, 241) and (218, 96).
; PLAN: r0=60(x1), r1=241(y1), r2=218(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 241
LDI r2, 218
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
