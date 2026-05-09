; DESCRIPTION: Draws a purple line from (242, 36) to (5, 44).
; PLAN: r0=242(x1), r1=36(y1), r2=5(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 36
LDI r2, 5
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
