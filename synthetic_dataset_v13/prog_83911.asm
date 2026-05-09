; DESCRIPTION: Places a white line segment connecting (5, 99) to (392, 13).
; PLAN: r0=5(x1), r1=99(y1), r2=392(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 99
LDI r2, 392
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
