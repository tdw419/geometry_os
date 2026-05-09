; DESCRIPTION: Draws a purple line from (144, 204) to (295, 141).
; PLAN: r0=144(x1), r1=204(y1), r2=295(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 204
LDI r2, 295
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
