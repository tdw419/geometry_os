; DESCRIPTION: Renders a white line between points (432, 168) and (372, 11).
; PLAN: r0=432(x1), r1=168(y1), r2=372(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 168
LDI r2, 372
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
