; DESCRIPTION: Renders a magenta line between points (367, 47) and (152, 238).
; PLAN: r0=367(x1), r1=47(y1), r2=152(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 47
LDI r2, 152
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
