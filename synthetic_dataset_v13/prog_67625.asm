; DESCRIPTION: Draws a magenta line from (301, 159) to (265, 247).
; PLAN: r0=301(x1), r1=159(y1), r2=265(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 159
LDI r2, 265
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
