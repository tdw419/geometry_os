; DESCRIPTION: Draws a purple line from (406, 27) to (352, 205).
; PLAN: r0=406(x1), r1=27(y1), r2=352(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 27
LDI r2, 352
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
