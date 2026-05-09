; DESCRIPTION: Renders a purple line between points (401, 63) and (444, 181).
; PLAN: r0=401(x1), r1=63(y1), r2=444(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 63
LDI r2, 444
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
