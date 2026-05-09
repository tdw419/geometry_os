; DESCRIPTION: Draws a purple line from (401, 88) to (8, 50).
; PLAN: r0=401(x1), r1=88(y1), r2=8(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 88
LDI r2, 8
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
