; DESCRIPTION: Places a red line segment connecting (357, 152) to (117, 71).
; PLAN: r0=357(x1), r1=152(y1), r2=117(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 152
LDI r2, 117
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
