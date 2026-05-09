; DESCRIPTION: Draws a magenta line from (11, 236) to (237, 162).
; PLAN: r0=11(x1), r1=236(y1), r2=237(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 236
LDI r2, 237
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
