; DESCRIPTION: Places a cyan line segment connecting (82, 252) to (150, 235).
; PLAN: r0=82(x1), r1=252(y1), r2=150(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 252
LDI r2, 150
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
