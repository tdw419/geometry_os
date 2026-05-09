; DESCRIPTION: Places a green line segment connecting (35, 28) to (91, 124).
; PLAN: r0=35(x1), r1=28(y1), r2=91(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 28
LDI r2, 91
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
