; DESCRIPTION: Renders a magenta line between points (365, 29) and (153, 238).
; PLAN: r0=365(x1), r1=29(y1), r2=153(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 29
LDI r2, 153
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
