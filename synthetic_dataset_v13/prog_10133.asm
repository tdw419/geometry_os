; DESCRIPTION: Draws a blue line from (417, 123) to (483, 42).
; PLAN: r0=417(x1), r1=123(y1), r2=483(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 123
LDI r2, 483
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
