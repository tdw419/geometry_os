; DESCRIPTION: Places a white line segment connecting (510, 222) to (199, 161).
; PLAN: r0=510(x1), r1=222(y1), r2=199(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 222
LDI r2, 199
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
