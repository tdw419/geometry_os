; DESCRIPTION: Places a white line segment connecting (256, 95) to (47, 127).
; PLAN: r0=256(x1), r1=95(y1), r2=47(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 95
LDI r2, 47
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
