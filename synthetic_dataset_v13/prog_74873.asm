; DESCRIPTION: Renders a blue line between points (321, 221) and (161, 12).
; PLAN: r0=321(x1), r1=221(y1), r2=161(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 221
LDI r2, 161
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
