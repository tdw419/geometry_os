; DESCRIPTION: Renders a red line between points (98, 204) and (190, 107).
; PLAN: r0=98(x1), r1=204(y1), r2=190(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 204
LDI r2, 190
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
