; DESCRIPTION: Places a magenta line segment connecting (217, 231) to (140, 49).
; PLAN: r0=217(x1), r1=231(y1), r2=140(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 231
LDI r2, 140
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
