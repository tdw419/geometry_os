; DESCRIPTION: Places a magenta line segment connecting (440, 98) to (317, 200).
; PLAN: r0=440(x1), r1=98(y1), r2=317(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 98
LDI r2, 317
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
