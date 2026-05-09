; DESCRIPTION: Renders a magenta line between points (372, 114) and (126, 180).
; PLAN: r0=372(x1), r1=114(y1), r2=126(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 114
LDI r2, 126
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
