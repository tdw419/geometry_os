; DESCRIPTION: Renders a blue line between points (462, 221) and (25, 146).
; PLAN: r0=462(x1), r1=221(y1), r2=25(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 221
LDI r2, 25
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
