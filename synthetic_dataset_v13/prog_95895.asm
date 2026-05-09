; DESCRIPTION: Renders a magenta line between points (14, 149) and (389, 210).
; PLAN: r0=14(x1), r1=149(y1), r2=389(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 149
LDI r2, 389
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
