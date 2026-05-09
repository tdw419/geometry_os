; DESCRIPTION: Draws a purple line from (45, 109) to (442, 117).
; PLAN: r0=45(x1), r1=109(y1), r2=442(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 109
LDI r2, 442
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
