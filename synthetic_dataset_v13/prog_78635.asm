; DESCRIPTION: Draws a magenta line from (188, 180) to (170, 208).
; PLAN: r0=188(x1), r1=180(y1), r2=170(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 180
LDI r2, 170
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
