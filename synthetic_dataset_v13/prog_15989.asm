; DESCRIPTION: Draws a purple line from (261, 126) to (317, 102).
; PLAN: r0=261(x1), r1=126(y1), r2=317(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 126
LDI r2, 317
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
