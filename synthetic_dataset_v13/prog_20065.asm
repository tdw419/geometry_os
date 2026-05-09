; DESCRIPTION: Draws a purple line from (405, 141) to (392, 104).
; PLAN: r0=405(x1), r1=141(y1), r2=392(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 141
LDI r2, 392
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
