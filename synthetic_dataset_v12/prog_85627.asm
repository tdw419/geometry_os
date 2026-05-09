; DESCRIPTION: Draws a purple line from (21, 9) to (428, 128).
; PLAN: r0=21(x1), r1=9(y1), r2=428(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 9
LDI r2, 428
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
