; DESCRIPTION: Places a white line segment connecting (29, 18) to (446, 185).
; PLAN: r0=29(x1), r1=18(y1), r2=446(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 18
LDI r2, 446
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
