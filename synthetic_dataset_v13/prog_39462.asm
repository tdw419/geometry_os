; DESCRIPTION: Renders a green line between points (93, 71) and (108, 157).
; PLAN: r0=93(x1), r1=71(y1), r2=108(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 71
LDI r2, 108
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
