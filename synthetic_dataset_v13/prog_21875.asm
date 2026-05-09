; DESCRIPTION: Places a red line segment connecting (199, 217) to (392, 166).
; PLAN: r0=199(x1), r1=217(y1), r2=392(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 217
LDI r2, 392
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
