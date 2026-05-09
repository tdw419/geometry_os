; DESCRIPTION: Draws a purple line from (384, 57) to (154, 5).
; PLAN: r0=384(x1), r1=57(y1), r2=154(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 57
LDI r2, 154
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
