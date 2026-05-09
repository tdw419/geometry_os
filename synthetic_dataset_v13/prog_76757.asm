; DESCRIPTION: Renders a blue line between points (75, 189) and (456, 143).
; PLAN: r0=75(x1), r1=189(y1), r2=456(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 189
LDI r2, 456
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
