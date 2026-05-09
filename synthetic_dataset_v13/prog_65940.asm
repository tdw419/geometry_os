; DESCRIPTION: Draws a blue line from (299, 62) to (449, 195).
; PLAN: r0=299(x1), r1=62(y1), r2=449(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 62
LDI r2, 449
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
