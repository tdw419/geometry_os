; DESCRIPTION: Draws a blue line from (86, 163) to (443, 168).
; PLAN: r0=86(x1), r1=163(y1), r2=443(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 163
LDI r2, 443
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
