; DESCRIPTION: Places a cyan line segment connecting (478, 235) to (356, 70).
; PLAN: r0=478(x1), r1=235(y1), r2=356(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 235
LDI r2, 356
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
