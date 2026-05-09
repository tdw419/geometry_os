; DESCRIPTION: Places a white line segment connecting (87, 12) to (428, 171).
; PLAN: r0=87(x1), r1=12(y1), r2=428(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 12
LDI r2, 428
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
