; DESCRIPTION: Renders a magenta line between points (248, 25) and (389, 166).
; PLAN: r0=248(x1), r1=25(y1), r2=389(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 25
LDI r2, 389
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
