; DESCRIPTION: Places a white line segment connecting (242, 59) to (99, 235).
; PLAN: r0=242(x1), r1=59(y1), r2=99(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 59
LDI r2, 99
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
