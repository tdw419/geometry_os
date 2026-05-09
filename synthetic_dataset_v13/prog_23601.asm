; DESCRIPTION: Draws a magenta line from (202, 212) to (417, 219).
; PLAN: r0=202(x1), r1=212(y1), r2=417(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 212
LDI r2, 417
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
