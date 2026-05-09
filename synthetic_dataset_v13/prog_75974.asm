; DESCRIPTION: Places a black line segment connecting (439, 247) to (150, 33).
; PLAN: r0=439(x1), r1=247(y1), r2=150(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 247
LDI r2, 150
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
