; DESCRIPTION: Draws a purple line from (410, 161) to (12, 182).
; PLAN: r0=410(x1), r1=161(y1), r2=12(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 161
LDI r2, 12
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
