; DESCRIPTION: Draws a purple line from (46, 176) to (473, 12).
; PLAN: r0=46(x1), r1=176(y1), r2=473(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 176
LDI r2, 473
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
