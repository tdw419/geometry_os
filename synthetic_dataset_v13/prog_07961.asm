; DESCRIPTION: Places a white line segment connecting (54, 113) to (92, 47).
; PLAN: r0=54(x1), r1=113(y1), r2=92(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 113
LDI r2, 92
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
