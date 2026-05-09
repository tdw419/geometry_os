; DESCRIPTION: Renders a magenta line between points (414, 138) and (308, 126).
; PLAN: r0=414(x1), r1=138(y1), r2=308(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 138
LDI r2, 308
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
