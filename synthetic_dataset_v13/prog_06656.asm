; DESCRIPTION: Places a white line segment connecting (77, 255) to (126, 126).
; PLAN: r0=77(x1), r1=255(y1), r2=126(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 255
LDI r2, 126
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
