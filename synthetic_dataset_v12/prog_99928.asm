; DESCRIPTION: Draws a magenta line from (55, 226) to (307, 70).
; PLAN: r0=55(x1), r1=226(y1), r2=307(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 226
LDI r2, 307
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
