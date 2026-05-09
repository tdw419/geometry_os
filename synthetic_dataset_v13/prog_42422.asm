; DESCRIPTION: Draws a cyan line from (83, 30) to (422, 235).
; PLAN: r0=83(x1), r1=30(y1), r2=422(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 30
LDI r2, 422
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
