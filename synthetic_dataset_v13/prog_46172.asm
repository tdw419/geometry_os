; DESCRIPTION: Places a green line segment connecting (1, 35) to (59, 235).
; PLAN: r0=1(x1), r1=35(y1), r2=59(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 35
LDI r2, 59
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
