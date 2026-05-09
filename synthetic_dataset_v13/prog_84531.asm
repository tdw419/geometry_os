; DESCRIPTION: Draws a blue line from (319, 219) to (152, 91).
; PLAN: r0=319(x1), r1=219(y1), r2=152(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 219
LDI r2, 152
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
