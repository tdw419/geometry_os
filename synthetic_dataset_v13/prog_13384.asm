; DESCRIPTION: Renders a green line between points (164, 119) and (143, 157).
; PLAN: r0=164(x1), r1=119(y1), r2=143(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 119
LDI r2, 143
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
