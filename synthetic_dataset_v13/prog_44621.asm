; DESCRIPTION: Renders a blue line between points (241, 134) and (393, 222).
; PLAN: r0=241(x1), r1=134(y1), r2=393(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 134
LDI r2, 393
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
