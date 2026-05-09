; DESCRIPTION: Draws a purple line from (58, 124) to (63, 14).
; PLAN: r0=58(x1), r1=124(y1), r2=63(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 124
LDI r2, 63
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
