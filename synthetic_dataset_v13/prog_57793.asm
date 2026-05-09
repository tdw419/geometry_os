; DESCRIPTION: Renders a magenta line between points (168, 82) and (486, 88).
; PLAN: r0=168(x1), r1=82(y1), r2=486(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 82
LDI r2, 486
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
