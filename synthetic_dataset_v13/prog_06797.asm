; DESCRIPTION: Renders a green line between points (202, 100) and (456, 119).
; PLAN: r0=202(x1), r1=100(y1), r2=456(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 100
LDI r2, 456
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
