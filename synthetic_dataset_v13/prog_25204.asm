; DESCRIPTION: Draws a purple line from (79, 64) to (275, 180).
; PLAN: r0=79(x1), r1=64(y1), r2=275(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 64
LDI r2, 275
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
