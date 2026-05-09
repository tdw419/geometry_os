; DESCRIPTION: Places a magenta line segment connecting (385, 113) to (165, 15).
; PLAN: r0=385(x1), r1=113(y1), r2=165(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 113
LDI r2, 165
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
