; DESCRIPTION: Places a cyan line segment connecting (235, 111) to (289, 10).
; PLAN: r0=235(x1), r1=111(y1), r2=289(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 111
LDI r2, 289
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
