; DESCRIPTION: Draws a magenta line from (440, 236) to (200, 69).
; PLAN: r0=440(x1), r1=236(y1), r2=200(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 236
LDI r2, 200
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
