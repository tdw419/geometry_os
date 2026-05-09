; DESCRIPTION: Places a cyan line segment connecting (411, 105) to (381, 235).
; PLAN: r0=411(x1), r1=105(y1), r2=381(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 105
LDI r2, 381
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
