; DESCRIPTION: Draws a purple line from (239, 39) to (405, 245).
; PLAN: r0=239(x1), r1=39(y1), r2=405(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 39
LDI r2, 405
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
