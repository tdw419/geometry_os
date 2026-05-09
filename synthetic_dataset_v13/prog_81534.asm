; DESCRIPTION: Draws a purple line from (274, 21) to (401, 215).
; PLAN: r0=274(x1), r1=21(y1), r2=401(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 21
LDI r2, 401
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
