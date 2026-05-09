; DESCRIPTION: Draws a blue line from (352, 30) to (237, 214).
; PLAN: r0=352(x1), r1=30(y1), r2=237(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 30
LDI r2, 237
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
