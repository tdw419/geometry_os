; DESCRIPTION: Draws a purple line from (509, 157) to (60, 117).
; PLAN: r0=509(x1), r1=157(y1), r2=60(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 157
LDI r2, 60
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
