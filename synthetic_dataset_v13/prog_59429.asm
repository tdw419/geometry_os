; DESCRIPTION: Draws a purple line from (126, 79) to (368, 6).
; PLAN: r0=126(x1), r1=79(y1), r2=368(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 79
LDI r2, 368
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
