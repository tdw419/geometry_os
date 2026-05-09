; DESCRIPTION: Places a white line segment connecting (63, 238) to (91, 116).
; PLAN: r0=63(x1), r1=238(y1), r2=91(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 238
LDI r2, 91
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
