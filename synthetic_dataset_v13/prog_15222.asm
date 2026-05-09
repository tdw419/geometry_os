; DESCRIPTION: Places a cyan line segment connecting (235, 119) to (469, 163).
; PLAN: r0=235(x1), r1=119(y1), r2=469(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 119
LDI r2, 469
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
