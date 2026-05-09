; DESCRIPTION: Places a white line segment connecting (172, 14) to (50, 240).
; PLAN: r0=172(x1), r1=14(y1), r2=50(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 14
LDI r2, 50
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
