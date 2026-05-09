; DESCRIPTION: Renders a magenta line between points (153, 168) and (400, 31).
; PLAN: r0=153(x1), r1=168(y1), r2=400(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 168
LDI r2, 400
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
