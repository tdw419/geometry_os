; DESCRIPTION: Draws a purple line from (481, 38) to (63, 214).
; PLAN: r0=481(x1), r1=38(y1), r2=63(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 38
LDI r2, 63
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
