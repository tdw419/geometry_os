; DESCRIPTION: Draws a magenta line from (180, 33) to (139, 193).
; PLAN: r0=180(x1), r1=33(y1), r2=139(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 33
LDI r2, 139
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
