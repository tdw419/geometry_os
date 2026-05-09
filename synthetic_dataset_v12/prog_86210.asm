; DESCRIPTION: Places a cyan line segment connecting (87, 235) to (211, 248).
; PLAN: r0=87(x1), r1=235(y1), r2=211(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 235
LDI r2, 211
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
