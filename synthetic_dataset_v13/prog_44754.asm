; DESCRIPTION: Draws a purple line from (25, 70) to (150, 128).
; PLAN: r0=25(x1), r1=70(y1), r2=150(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 70
LDI r2, 150
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
