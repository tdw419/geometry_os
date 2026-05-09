; DESCRIPTION: Places a blue line segment connecting (47, 54) to (77, 42).
; PLAN: r0=47(x1), r1=54(y1), r2=77(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 54
LDI r2, 77
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
