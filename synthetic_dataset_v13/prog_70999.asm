; DESCRIPTION: Places a white line segment connecting (328, 199) to (50, 98).
; PLAN: r0=328(x1), r1=199(y1), r2=50(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 199
LDI r2, 50
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
