; DESCRIPTION: Draws a magenta line from (230, 193) to (511, 120).
; PLAN: r0=230(x1), r1=193(y1), r2=511(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 193
LDI r2, 511
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
