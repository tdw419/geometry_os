; DESCRIPTION: Places a magenta line segment connecting (406, 78) to (361, 70).
; PLAN: r0=406(x1), r1=78(y1), r2=361(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 78
LDI r2, 361
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
