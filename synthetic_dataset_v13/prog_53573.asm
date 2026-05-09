; DESCRIPTION: Renders a white line between points (15, 131) and (444, 204).
; PLAN: r0=15(x1), r1=131(y1), r2=444(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 131
LDI r2, 444
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
