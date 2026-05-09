; DESCRIPTION: Places a white line segment connecting (331, 152) to (50, 52).
; PLAN: r0=331(x1), r1=152(y1), r2=50(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 152
LDI r2, 50
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
