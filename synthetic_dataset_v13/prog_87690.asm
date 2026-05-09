; DESCRIPTION: Draws a purple line from (150, 126) to (151, 75).
; PLAN: r0=150(x1), r1=126(y1), r2=151(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 126
LDI r2, 151
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
