; DESCRIPTION: Renders a magenta line between points (238, 74) and (138, 195).
; PLAN: r0=238(x1), r1=74(y1), r2=138(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 74
LDI r2, 138
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
