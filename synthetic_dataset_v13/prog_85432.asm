; DESCRIPTION: Places a magenta line segment connecting (487, 26) to (317, 37).
; PLAN: r0=487(x1), r1=26(y1), r2=317(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 26
LDI r2, 317
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
