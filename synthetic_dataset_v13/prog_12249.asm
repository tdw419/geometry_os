; DESCRIPTION: Places a white line segment connecting (439, 208) to (260, 138).
; PLAN: r0=439(x1), r1=208(y1), r2=260(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 208
LDI r2, 260
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
