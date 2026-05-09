; DESCRIPTION: Renders a magenta line between points (118, 233) and (70, 214).
; PLAN: r0=118(x1), r1=233(y1), r2=70(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 233
LDI r2, 70
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
