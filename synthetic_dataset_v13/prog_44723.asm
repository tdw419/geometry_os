; DESCRIPTION: Places a white line segment connecting (272, 156) to (235, 69).
; PLAN: r0=272(x1), r1=156(y1), r2=235(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 156
LDI r2, 235
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
