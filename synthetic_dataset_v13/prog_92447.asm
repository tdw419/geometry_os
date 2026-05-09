; DESCRIPTION: Draws a magenta line from (482, 87) to (451, 239).
; PLAN: r0=482(x1), r1=87(y1), r2=451(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 87
LDI r2, 451
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
