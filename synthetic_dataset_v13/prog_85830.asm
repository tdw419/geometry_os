; DESCRIPTION: Draws a purple line from (492, 73) to (401, 198).
; PLAN: r0=492(x1), r1=73(y1), r2=401(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 73
LDI r2, 401
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
