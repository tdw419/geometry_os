; DESCRIPTION: Renders a magenta line between points (53, 13) and (183, 93).
; PLAN: r0=53(x1), r1=13(y1), r2=183(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 13
LDI r2, 183
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
