; DESCRIPTION: Draws a red line from (451, 247) to (168, 66).
; PLAN: r0=451(x1), r1=247(y1), r2=168(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 247
LDI r2, 168
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
