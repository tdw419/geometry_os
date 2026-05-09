; DESCRIPTION: Draws a magenta line from (236, 219) to (349, 164).
; PLAN: r0=236(x1), r1=219(y1), r2=349(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 219
LDI r2, 349
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
