; DESCRIPTION: Places a green line segment connecting (260, 11) to (45, 235).
; PLAN: r0=260(x1), r1=11(y1), r2=45(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 11
LDI r2, 45
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
