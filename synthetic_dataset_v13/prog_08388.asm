; DESCRIPTION: Renders a magenta line between points (238, 83) and (150, 226).
; PLAN: r0=238(x1), r1=83(y1), r2=150(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 83
LDI r2, 150
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
