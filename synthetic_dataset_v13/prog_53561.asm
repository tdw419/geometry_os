; DESCRIPTION: Renders a magenta line between points (73, 208) and (413, 69).
; PLAN: r0=73(x1), r1=208(y1), r2=413(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 208
LDI r2, 413
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
