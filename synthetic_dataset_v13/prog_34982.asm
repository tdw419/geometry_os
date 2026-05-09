; DESCRIPTION: Draws a purple line from (338, 45) to (262, 57).
; PLAN: r0=338(x1), r1=45(y1), r2=262(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 45
LDI r2, 262
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
