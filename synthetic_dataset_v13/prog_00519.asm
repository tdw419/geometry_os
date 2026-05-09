; DESCRIPTION: Renders a magenta line between points (273, 61) and (59, 94).
; PLAN: r0=273(x1), r1=61(y1), r2=59(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 61
LDI r2, 59
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
