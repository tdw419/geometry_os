; DESCRIPTION: Draws a magenta line from (119, 51) to (214, 86).
; PLAN: r0=119(x1), r1=51(y1), r2=214(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 51
LDI r2, 214
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
