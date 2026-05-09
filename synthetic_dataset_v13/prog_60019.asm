; DESCRIPTION: Places a magenta line segment connecting (420, 226) to (385, 98).
; PLAN: r0=420(x1), r1=226(y1), r2=385(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 226
LDI r2, 385
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
