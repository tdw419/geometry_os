; DESCRIPTION: Draws a purple line from (294, 126) to (378, 21).
; PLAN: r0=294(x1), r1=126(y1), r2=378(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 126
LDI r2, 378
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
