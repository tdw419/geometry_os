; DESCRIPTION: Renders a magenta line between points (131, 173) and (259, 216).
; PLAN: r0=131(x1), r1=173(y1), r2=259(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 173
LDI r2, 259
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
