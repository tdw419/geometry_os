; DESCRIPTION: Places a cyan line segment connecting (290, 235) to (498, 104).
; PLAN: r0=290(x1), r1=235(y1), r2=498(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 235
LDI r2, 498
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
