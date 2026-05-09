; DESCRIPTION: Places a white line segment connecting (69, 107) to (477, 152).
; PLAN: r0=69(x1), r1=107(y1), r2=477(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 107
LDI r2, 477
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
