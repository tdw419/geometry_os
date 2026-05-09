; DESCRIPTION: Renders a magenta line between points (383, 65) and (356, 121).
; PLAN: r0=383(x1), r1=65(y1), r2=356(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 65
LDI r2, 356
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
