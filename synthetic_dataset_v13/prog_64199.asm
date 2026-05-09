; DESCRIPTION: Places a white line segment connecting (180, 150) to (338, 79).
; PLAN: r0=180(x1), r1=150(y1), r2=338(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 150
LDI r2, 338
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
