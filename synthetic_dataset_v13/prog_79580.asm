; DESCRIPTION: Renders a blue line between points (383, 241) and (76, 182).
; PLAN: r0=383(x1), r1=241(y1), r2=76(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 241
LDI r2, 76
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
