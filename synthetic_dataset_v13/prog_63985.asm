; DESCRIPTION: Renders a magenta line between points (214, 168) and (35, 170).
; PLAN: r0=214(x1), r1=168(y1), r2=35(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 168
LDI r2, 35
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
