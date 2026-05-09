; DESCRIPTION: Places a white line segment connecting (127, 149) to (315, 252).
; PLAN: r0=127(x1), r1=149(y1), r2=315(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 149
LDI r2, 315
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
