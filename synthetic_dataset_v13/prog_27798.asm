; DESCRIPTION: Draws a purple line from (206, 177) to (105, 126).
; PLAN: r0=206(x1), r1=177(y1), r2=105(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 177
LDI r2, 105
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
