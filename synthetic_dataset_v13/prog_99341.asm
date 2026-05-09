; DESCRIPTION: Draws a purple line from (237, 176) to (18, 171).
; PLAN: r0=237(x1), r1=176(y1), r2=18(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 176
LDI r2, 18
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
