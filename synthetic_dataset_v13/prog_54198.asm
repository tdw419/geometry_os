; DESCRIPTION: Places a magenta line segment connecting (151, 186) to (150, 4).
; PLAN: r0=151(x1), r1=186(y1), r2=150(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 186
LDI r2, 150
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
