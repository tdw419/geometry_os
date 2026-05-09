; DESCRIPTION: Places a white line segment connecting (28, 100) to (487, 92).
; PLAN: r0=28(x1), r1=100(y1), r2=487(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 100
LDI r2, 487
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
