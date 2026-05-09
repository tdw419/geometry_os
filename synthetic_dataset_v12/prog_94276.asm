; DESCRIPTION: Places a green line segment connecting (407, 111) to (180, 100).
; PLAN: r0=407(x1), r1=111(y1), r2=180(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 111
LDI r2, 180
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
