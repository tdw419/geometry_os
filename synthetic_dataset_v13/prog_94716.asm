; DESCRIPTION: Places a magenta line segment connecting (295, 78) to (222, 135).
; PLAN: r0=295(x1), r1=78(y1), r2=222(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 78
LDI r2, 222
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
