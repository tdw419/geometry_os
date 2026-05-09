; DESCRIPTION: Places a magenta line segment connecting (233, 90) to (418, 187).
; PLAN: r0=233(x1), r1=90(y1), r2=418(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 90
LDI r2, 418
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
