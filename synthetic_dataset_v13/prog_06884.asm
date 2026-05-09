; DESCRIPTION: Places a black line segment connecting (255, 144) to (361, 187).
; PLAN: r0=255(x1), r1=144(y1), r2=361(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 144
LDI r2, 361
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
