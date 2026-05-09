; DESCRIPTION: Draws a blue line from (93, 237) to (285, 202).
; PLAN: r0=93(x1), r1=237(y1), r2=285(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 237
LDI r2, 285
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
