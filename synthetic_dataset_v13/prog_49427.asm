; DESCRIPTION: Renders a red line between points (18, 25) and (405, 155).
; PLAN: r0=18(x1), r1=25(y1), r2=405(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 25
LDI r2, 405
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
