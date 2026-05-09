; DESCRIPTION: Places a magenta line segment connecting (98, 28) to (70, 16).
; PLAN: r0=98(x1), r1=28(y1), r2=70(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 28
LDI r2, 70
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
