; DESCRIPTION: Places a white line segment connecting (118, 27) to (377, 108).
; PLAN: r0=118(x1), r1=27(y1), r2=377(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 27
LDI r2, 377
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
