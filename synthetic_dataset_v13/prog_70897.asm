; DESCRIPTION: Renders a blue line between points (176, 151) and (462, 182).
; PLAN: r0=176(x1), r1=151(y1), r2=462(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 151
LDI r2, 462
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
