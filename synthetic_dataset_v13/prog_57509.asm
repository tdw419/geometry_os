; DESCRIPTION: Places a white line segment connecting (449, 7) to (260, 38).
; PLAN: r0=449(x1), r1=7(y1), r2=260(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 7
LDI r2, 260
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
