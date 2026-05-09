; DESCRIPTION: Draws a purple line from (466, 214) to (509, 214).
; PLAN: r0=466(x1), r1=214(y1), r2=509(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 214
LDI r2, 509
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
