; DESCRIPTION: Renders a red line between points (245, 39) and (448, 243).
; PLAN: r0=245(x1), r1=39(y1), r2=448(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 39
LDI r2, 448
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
