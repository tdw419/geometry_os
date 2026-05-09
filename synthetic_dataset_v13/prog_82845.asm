; DESCRIPTION: Places a green line segment connecting (7, 168) to (25, 235).
; PLAN: r0=7(x1), r1=168(y1), r2=25(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 168
LDI r2, 25
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
