; DESCRIPTION: Places a cyan line segment connecting (299, 22) to (95, 235).
; PLAN: r0=299(x1), r1=22(y1), r2=95(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 22
LDI r2, 95
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
