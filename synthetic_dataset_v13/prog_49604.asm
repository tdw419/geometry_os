; DESCRIPTION: Renders a red line between points (125, 202) and (477, 208).
; PLAN: r0=125(x1), r1=202(y1), r2=477(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 202
LDI r2, 477
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
