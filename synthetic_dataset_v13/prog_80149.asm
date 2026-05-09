; DESCRIPTION: Renders a red line between points (46, 202) and (508, 142).
; PLAN: r0=46(x1), r1=202(y1), r2=508(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 202
LDI r2, 508
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
