; DESCRIPTION: Places a cyan line segment connecting (351, 32) to (17, 217).
; PLAN: r0=351(x1), r1=32(y1), r2=17(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 32
LDI r2, 17
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
