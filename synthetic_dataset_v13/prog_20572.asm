; DESCRIPTION: Draws a purple line from (491, 42) to (255, 56).
; PLAN: r0=491(x1), r1=42(y1), r2=255(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 42
LDI r2, 255
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
