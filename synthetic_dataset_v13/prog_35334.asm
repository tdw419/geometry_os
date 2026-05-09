; DESCRIPTION: Places a green line segment connecting (46, 247) to (28, 75).
; PLAN: r0=46(x1), r1=247(y1), r2=28(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 247
LDI r2, 28
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
