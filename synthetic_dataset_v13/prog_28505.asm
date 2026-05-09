; DESCRIPTION: Draws a purple line from (75, 211) to (27, 243).
; PLAN: r0=75(x1), r1=211(y1), r2=27(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 211
LDI r2, 27
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
