; DESCRIPTION: Renders a magenta line between points (452, 225) and (481, 157).
; PLAN: r0=452(x1), r1=225(y1), r2=481(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 225
LDI r2, 481
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
