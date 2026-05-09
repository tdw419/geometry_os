; DESCRIPTION: Draws a magenta line from (94, 7) to (271, 180).
; PLAN: r0=94(x1), r1=7(y1), r2=271(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 7
LDI r2, 271
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
