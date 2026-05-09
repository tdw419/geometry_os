; DESCRIPTION: Draws a yellow line from (423, 194) to (213, 176).
; PLAN: r0=423(x1), r1=194(y1), r2=213(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 194
LDI r2, 213
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
