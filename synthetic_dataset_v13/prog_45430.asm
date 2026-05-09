; DESCRIPTION: Draws a magenta line from (389, 82) to (406, 247).
; PLAN: r0=389(x1), r1=82(y1), r2=406(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 82
LDI r2, 406
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
