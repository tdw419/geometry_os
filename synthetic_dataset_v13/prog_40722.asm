; DESCRIPTION: Places a magenta line segment connecting (339, 222) to (98, 95).
; PLAN: r0=339(x1), r1=222(y1), r2=98(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 222
LDI r2, 98
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
