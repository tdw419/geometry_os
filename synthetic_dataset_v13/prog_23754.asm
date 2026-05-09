; DESCRIPTION: Places a white line segment connecting (126, 30) to (105, 226).
; PLAN: r0=126(x1), r1=30(y1), r2=105(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 30
LDI r2, 105
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
