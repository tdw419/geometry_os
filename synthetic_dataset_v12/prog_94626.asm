; DESCRIPTION: Renders a magenta line between points (507, 93) and (183, 91).
; PLAN: r0=507(x1), r1=93(y1), r2=183(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 93
LDI r2, 183
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
