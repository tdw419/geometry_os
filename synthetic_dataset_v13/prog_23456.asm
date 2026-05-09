; DESCRIPTION: Renders a green line between points (112, 143) and (360, 238).
; PLAN: r0=112(x1), r1=143(y1), r2=360(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 143
LDI r2, 360
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
