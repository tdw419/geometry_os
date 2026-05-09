; DESCRIPTION: Renders a magenta line between points (39, 168) and (349, 4).
; PLAN: r0=39(x1), r1=168(y1), r2=349(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 168
LDI r2, 349
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
