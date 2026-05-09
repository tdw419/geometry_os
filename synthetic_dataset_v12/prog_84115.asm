; DESCRIPTION: Renders a green line between points (149, 172) and (111, 212).
; PLAN: r0=149(x1), r1=172(y1), r2=111(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 172
LDI r2, 111
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
