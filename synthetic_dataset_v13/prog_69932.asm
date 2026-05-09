; DESCRIPTION: Places a white line segment connecting (50, 110) to (307, 90).
; PLAN: r0=50(x1), r1=110(y1), r2=307(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 110
LDI r2, 307
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
