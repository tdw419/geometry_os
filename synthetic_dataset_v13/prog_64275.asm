; DESCRIPTION: Draws a magenta line from (180, 160) to (411, 23).
; PLAN: r0=180(x1), r1=160(y1), r2=411(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 160
LDI r2, 411
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
