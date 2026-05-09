; DESCRIPTION: Draws a purple line from (400, 224) to (228, 233).
; PLAN: r0=400(x1), r1=224(y1), r2=228(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 224
LDI r2, 228
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
