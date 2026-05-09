; DESCRIPTION: Renders a red line between points (225, 30) and (213, 243).
; PLAN: r0=225(x1), r1=30(y1), r2=213(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 30
LDI r2, 213
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
