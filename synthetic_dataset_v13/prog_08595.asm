; DESCRIPTION: Draws a magenta line from (279, 47) to (93, 59).
; PLAN: r0=279(x1), r1=47(y1), r2=93(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 47
LDI r2, 93
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
