; DESCRIPTION: Places a magenta line segment connecting (339, 141) to (251, 239).
; PLAN: r0=339(x1), r1=141(y1), r2=251(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 141
LDI r2, 251
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
