; DESCRIPTION: Draws a purple line from (294, 245) to (342, 247).
; PLAN: r0=294(x1), r1=245(y1), r2=342(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 245
LDI r2, 342
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
