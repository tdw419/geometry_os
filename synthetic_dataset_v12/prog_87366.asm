; DESCRIPTION: Places a black line segment connecting (157, 83) to (439, 192).
; PLAN: r0=157(x1), r1=83(y1), r2=439(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 83
LDI r2, 439
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
