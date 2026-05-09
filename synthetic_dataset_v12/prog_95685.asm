; DESCRIPTION: Draws a purple line from (283, 209) to (76, 46).
; PLAN: r0=283(x1), r1=209(y1), r2=76(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 209
LDI r2, 76
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
