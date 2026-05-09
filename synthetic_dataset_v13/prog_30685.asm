; DESCRIPTION: Places a white line segment connecting (109, 132) to (260, 255).
; PLAN: r0=109(x1), r1=132(y1), r2=260(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 132
LDI r2, 260
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
