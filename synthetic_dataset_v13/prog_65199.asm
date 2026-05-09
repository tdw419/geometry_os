; DESCRIPTION: Draws a purple line from (401, 193) to (279, 83).
; PLAN: r0=401(x1), r1=193(y1), r2=279(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 193
LDI r2, 279
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
