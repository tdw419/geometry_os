; DESCRIPTION: Renders a red line between points (435, 238) and (363, 132).
; PLAN: r0=435(x1), r1=238(y1), r2=363(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 238
LDI r2, 363
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
