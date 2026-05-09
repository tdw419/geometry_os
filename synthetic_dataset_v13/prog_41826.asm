; DESCRIPTION: Renders a blue line between points (309, 225) and (113, 141).
; PLAN: r0=309(x1), r1=225(y1), r2=113(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 225
LDI r2, 113
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
