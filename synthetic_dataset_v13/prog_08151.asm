; DESCRIPTION: Renders a magenta line between points (89, 24) and (238, 42).
; PLAN: r0=89(x1), r1=24(y1), r2=238(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 24
LDI r2, 238
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
