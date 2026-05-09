; DESCRIPTION: Places a black line segment connecting (180, 118) to (458, 239).
; PLAN: r0=180(x1), r1=118(y1), r2=458(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 118
LDI r2, 458
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
