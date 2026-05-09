; DESCRIPTION: Renders a red line between points (243, 159) and (269, 238).
; PLAN: r0=243(x1), r1=159(y1), r2=269(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 159
LDI r2, 269
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
