; DESCRIPTION: Draws a purple line from (294, 42) to (318, 199).
; PLAN: r0=294(x1), r1=42(y1), r2=318(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 42
LDI r2, 318
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
