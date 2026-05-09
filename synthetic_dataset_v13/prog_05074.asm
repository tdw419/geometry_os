; DESCRIPTION: Draws a purple line from (361, 242) to (180, 43).
; PLAN: r0=361(x1), r1=242(y1), r2=180(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 242
LDI r2, 180
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
