; DESCRIPTION: Places a green line segment connecting (309, 6) to (439, 58).
; PLAN: r0=309(x1), r1=6(y1), r2=439(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 6
LDI r2, 439
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
