; DESCRIPTION: Draws a magenta line from (462, 89) to (458, 166).
; PLAN: r0=462(x1), r1=89(y1), r2=458(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 89
LDI r2, 458
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
