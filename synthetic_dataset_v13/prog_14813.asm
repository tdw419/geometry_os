; DESCRIPTION: Places a magenta line segment connecting (300, 186) to (436, 115).
; PLAN: r0=300(x1), r1=186(y1), r2=436(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 186
LDI r2, 436
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
