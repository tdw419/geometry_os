; DESCRIPTION: Places a white line segment connecting (439, 242) to (317, 194).
; PLAN: r0=439(x1), r1=242(y1), r2=317(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 242
LDI r2, 317
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
