; DESCRIPTION: Places a magenta line segment connecting (510, 75) to (171, 175).
; PLAN: r0=510(x1), r1=75(y1), r2=171(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 75
LDI r2, 171
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
