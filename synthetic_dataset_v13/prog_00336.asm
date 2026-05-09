; DESCRIPTION: Places a white line segment connecting (272, 179) to (294, 140).
; PLAN: r0=272(x1), r1=179(y1), r2=294(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 179
LDI r2, 294
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
