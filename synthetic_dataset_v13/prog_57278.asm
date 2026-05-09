; DESCRIPTION: Renders a blue line between points (449, 143) and (234, 240).
; PLAN: r0=449(x1), r1=143(y1), r2=234(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 143
LDI r2, 234
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
