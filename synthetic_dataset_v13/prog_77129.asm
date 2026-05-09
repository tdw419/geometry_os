; DESCRIPTION: Places a white line segment connecting (445, 18) to (12, 50).
; PLAN: r0=445(x1), r1=18(y1), r2=12(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 18
LDI r2, 12
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
