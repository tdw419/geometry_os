; DESCRIPTION: Places a white line segment connecting (33, 28) to (161, 37).
; PLAN: r0=33(x1), r1=28(y1), r2=161(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 28
LDI r2, 161
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
