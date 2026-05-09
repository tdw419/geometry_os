; DESCRIPTION: Draws a purple line from (406, 220) to (108, 46).
; PLAN: r0=406(x1), r1=220(y1), r2=108(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 220
LDI r2, 108
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
