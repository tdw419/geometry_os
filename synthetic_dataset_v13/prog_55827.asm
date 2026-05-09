; DESCRIPTION: Draws a yellow line from (326, 238) to (332, 140).
; PLAN: r0=326(x1), r1=238(y1), r2=332(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 238
LDI r2, 332
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
