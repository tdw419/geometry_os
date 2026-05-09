; DESCRIPTION: Draws a purple line from (461, 15) to (295, 64).
; PLAN: r0=461(x1), r1=15(y1), r2=295(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 15
LDI r2, 295
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
