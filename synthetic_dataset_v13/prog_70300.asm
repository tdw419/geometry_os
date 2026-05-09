; DESCRIPTION: Places a white line segment connecting (30, 98) to (57, 45).
; PLAN: r0=30(x1), r1=98(y1), r2=57(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 98
LDI r2, 57
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
