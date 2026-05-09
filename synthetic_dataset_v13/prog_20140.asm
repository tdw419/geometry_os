; DESCRIPTION: Draws a purple line from (405, 215) to (506, 252).
; PLAN: r0=405(x1), r1=215(y1), r2=506(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 215
LDI r2, 506
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
