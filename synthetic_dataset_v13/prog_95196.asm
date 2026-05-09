; DESCRIPTION: Places a magenta line segment connecting (1, 98) to (392, 102).
; PLAN: r0=1(x1), r1=98(y1), r2=392(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 98
LDI r2, 392
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
