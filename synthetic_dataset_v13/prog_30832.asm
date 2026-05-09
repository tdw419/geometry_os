; DESCRIPTION: Places a magenta line segment connecting (270, 220) to (174, 31).
; PLAN: r0=270(x1), r1=220(y1), r2=174(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 220
LDI r2, 174
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
