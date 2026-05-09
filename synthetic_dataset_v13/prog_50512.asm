; DESCRIPTION: Draws a purple line from (40, 228) to (452, 117).
; PLAN: r0=40(x1), r1=228(y1), r2=452(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 228
LDI r2, 452
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
