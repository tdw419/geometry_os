; DESCRIPTION: Renders a magenta line between points (131, 47) and (356, 182).
; PLAN: r0=131(x1), r1=47(y1), r2=356(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 47
LDI r2, 356
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
