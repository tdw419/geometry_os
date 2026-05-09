; DESCRIPTION: Draws a purple line from (307, 224) to (39, 152).
; PLAN: r0=307(x1), r1=224(y1), r2=39(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 224
LDI r2, 39
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
