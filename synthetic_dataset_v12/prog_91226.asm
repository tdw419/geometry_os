; DESCRIPTION: Places a white line segment connecting (427, 248) to (64, 240).
; PLAN: r0=427(x1), r1=248(y1), r2=64(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 248
LDI r2, 64
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
