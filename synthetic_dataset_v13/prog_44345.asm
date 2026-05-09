; DESCRIPTION: Places a magenta line segment connecting (482, 127) to (283, 18).
; PLAN: r0=482(x1), r1=127(y1), r2=283(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 127
LDI r2, 283
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
