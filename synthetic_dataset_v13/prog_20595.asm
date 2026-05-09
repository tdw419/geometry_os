; DESCRIPTION: Draws a purple line from (405, 120) to (126, 131).
; PLAN: r0=405(x1), r1=120(y1), r2=126(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 120
LDI r2, 126
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
