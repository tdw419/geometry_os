; DESCRIPTION: Places a white line segment connecting (150, 128) to (15, 170).
; PLAN: r0=150(x1), r1=128(y1), r2=15(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 128
LDI r2, 15
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
