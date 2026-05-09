; DESCRIPTION: Places a magenta line segment connecting (306, 220) to (381, 39).
; PLAN: r0=306(x1), r1=220(y1), r2=381(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 220
LDI r2, 381
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
