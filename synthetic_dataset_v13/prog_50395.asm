; DESCRIPTION: Draws a purple line from (295, 213) to (407, 118).
; PLAN: r0=295(x1), r1=213(y1), r2=407(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 213
LDI r2, 407
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
