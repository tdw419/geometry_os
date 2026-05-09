; DESCRIPTION: Draws a purple line from (356, 223) to (261, 171).
; PLAN: r0=356(x1), r1=223(y1), r2=261(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 223
LDI r2, 261
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
