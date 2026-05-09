; DESCRIPTION: Draws a purple line from (337, 228) to (8, 115).
; PLAN: r0=337(x1), r1=228(y1), r2=8(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 228
LDI r2, 8
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
