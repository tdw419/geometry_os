; DESCRIPTION: Renders a magenta line between points (206, 93) and (167, 102).
; PLAN: r0=206(x1), r1=93(y1), r2=167(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 93
LDI r2, 167
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
