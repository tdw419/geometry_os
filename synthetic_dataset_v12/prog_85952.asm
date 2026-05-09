; DESCRIPTION: Places a white line segment connecting (328, 3) to (278, 120).
; PLAN: r0=328(x1), r1=3(y1), r2=278(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 3
LDI r2, 278
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
