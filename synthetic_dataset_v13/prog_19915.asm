; DESCRIPTION: Draws a purple line from (388, 152) to (405, 14).
; PLAN: r0=388(x1), r1=152(y1), r2=405(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 152
LDI r2, 405
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
