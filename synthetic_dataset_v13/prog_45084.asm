; DESCRIPTION: Draws a purple line from (483, 68) to (346, 247).
; PLAN: r0=483(x1), r1=68(y1), r2=346(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 68
LDI r2, 346
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
