; DESCRIPTION: Places a magenta line segment connecting (213, 170) to (504, 109).
; PLAN: r0=213(x1), r1=170(y1), r2=504(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 170
LDI r2, 504
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
