; DESCRIPTION: Draws a purple line from (33, 151) to (87, 223).
; PLAN: r0=33(x1), r1=151(y1), r2=87(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 151
LDI r2, 87
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
