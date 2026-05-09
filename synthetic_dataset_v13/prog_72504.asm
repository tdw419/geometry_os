; DESCRIPTION: Renders a red line between points (190, 140) and (59, 195).
; PLAN: r0=190(x1), r1=140(y1), r2=59(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 140
LDI r2, 59
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
