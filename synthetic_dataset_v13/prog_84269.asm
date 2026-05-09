; DESCRIPTION: Draws a purple line from (56, 228) to (273, 23).
; PLAN: r0=56(x1), r1=228(y1), r2=273(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 228
LDI r2, 273
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
