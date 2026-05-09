; DESCRIPTION: Places a white line segment connecting (260, 196) to (425, 120).
; PLAN: r0=260(x1), r1=196(y1), r2=425(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 196
LDI r2, 425
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
