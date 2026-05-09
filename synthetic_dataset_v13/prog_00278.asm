; DESCRIPTION: Draws a purple line from (295, 161) to (58, 208).
; PLAN: r0=295(x1), r1=161(y1), r2=58(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 161
LDI r2, 58
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
