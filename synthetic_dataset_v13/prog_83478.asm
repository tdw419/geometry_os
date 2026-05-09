; DESCRIPTION: Places a white line segment connecting (302, 180) to (64, 92).
; PLAN: r0=302(x1), r1=180(y1), r2=64(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 180
LDI r2, 64
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
