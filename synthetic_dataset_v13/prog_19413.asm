; DESCRIPTION: Places a magenta line segment connecting (223, 46) to (255, 251).
; PLAN: r0=223(x1), r1=46(y1), r2=255(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 46
LDI r2, 255
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
