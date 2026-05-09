; DESCRIPTION: Draws a purple line from (303, 27) to (70, 30).
; PLAN: r0=303(x1), r1=27(y1), r2=70(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 27
LDI r2, 70
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
