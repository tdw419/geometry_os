; DESCRIPTION: Draws a purple line from (217, 223) to (269, 108).
; PLAN: r0=217(x1), r1=223(y1), r2=269(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 223
LDI r2, 269
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
