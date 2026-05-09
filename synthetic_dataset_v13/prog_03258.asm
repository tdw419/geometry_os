; DESCRIPTION: Draws a purple line from (295, 72) to (117, 31).
; PLAN: r0=295(x1), r1=72(y1), r2=117(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 72
LDI r2, 117
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
