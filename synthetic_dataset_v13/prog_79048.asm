; DESCRIPTION: Places a magenta line segment connecting (218, 46) to (468, 240).
; PLAN: r0=218(x1), r1=46(y1), r2=468(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 46
LDI r2, 468
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
