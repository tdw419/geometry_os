; DESCRIPTION: Renders a magenta line between points (262, 102) and (452, 82).
; PLAN: r0=262(x1), r1=102(y1), r2=452(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 102
LDI r2, 452
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
