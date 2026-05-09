; DESCRIPTION: Draws a blue line from (271, 97) to (499, 223).
; PLAN: r0=271(x1), r1=97(y1), r2=499(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 97
LDI r2, 499
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
