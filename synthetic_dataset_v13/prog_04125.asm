; DESCRIPTION: Places a magenta line segment connecting (310, 248) to (475, 168).
; PLAN: r0=310(x1), r1=248(y1), r2=475(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 248
LDI r2, 475
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
