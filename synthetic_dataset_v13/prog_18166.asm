; DESCRIPTION: Renders a purple line between points (391, 126) and (441, 178).
; PLAN: r0=391(x1), r1=126(y1), r2=441(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 126
LDI r2, 441
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
