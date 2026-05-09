; DESCRIPTION: Places a white line segment connecting (289, 161) to (193, 28).
; PLAN: r0=289(x1), r1=161(y1), r2=193(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 161
LDI r2, 193
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
