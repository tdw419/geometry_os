; DESCRIPTION: Places a white line segment connecting (184, 189) to (30, 33).
; PLAN: r0=184(x1), r1=189(y1), r2=30(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 189
LDI r2, 30
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
