; DESCRIPTION: Draws a purple line from (116, 126) to (208, 224).
; PLAN: r0=116(x1), r1=126(y1), r2=208(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 126
LDI r2, 208
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
