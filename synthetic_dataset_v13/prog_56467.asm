; DESCRIPTION: Draws a blue line from (472, 215) to (508, 171).
; PLAN: r0=472(x1), r1=215(y1), r2=508(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 215
LDI r2, 508
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
