; DESCRIPTION: Renders a blue line between points (113, 117) and (462, 214).
; PLAN: r0=113(x1), r1=117(y1), r2=462(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 117
LDI r2, 462
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
