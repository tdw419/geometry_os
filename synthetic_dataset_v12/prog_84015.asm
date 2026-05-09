; DESCRIPTION: Renders a red line between points (89, 0) and (28, 204).
; PLAN: r0=89(x1), r1=0(y1), r2=28(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 0
LDI r2, 28
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
