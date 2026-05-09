; DESCRIPTION: Places a magenta line segment connecting (380, 27) to (472, 70).
; PLAN: r0=380(x1), r1=27(y1), r2=472(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 27
LDI r2, 472
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
