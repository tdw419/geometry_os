; DESCRIPTION: Places a magenta line segment connecting (437, 65) to (446, 106).
; PLAN: r0=437(x1), r1=65(y1), r2=446(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 65
LDI r2, 446
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
