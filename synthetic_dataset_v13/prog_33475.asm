; DESCRIPTION: Draws a purple line from (485, 117) to (301, 253).
; PLAN: r0=485(x1), r1=117(y1), r2=301(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 117
LDI r2, 301
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
