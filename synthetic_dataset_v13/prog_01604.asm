; DESCRIPTION: Places a blue line segment connecting (223, 195) to (31, 182).
; PLAN: r0=223(x1), r1=195(y1), r2=31(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 195
LDI r2, 31
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
