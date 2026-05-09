; DESCRIPTION: Renders a blue line between points (393, 231) and (368, 43).
; PLAN: r0=393(x1), r1=231(y1), r2=368(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 231
LDI r2, 368
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
