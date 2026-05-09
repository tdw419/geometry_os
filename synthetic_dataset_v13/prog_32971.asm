; DESCRIPTION: Places a white line segment connecting (156, 174) to (279, 94).
; PLAN: r0=156(x1), r1=174(y1), r2=279(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 174
LDI r2, 279
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
