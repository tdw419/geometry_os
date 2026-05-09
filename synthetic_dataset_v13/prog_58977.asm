; DESCRIPTION: Places a yellow line segment connecting (445, 235) to (180, 90).
; PLAN: r0=445(x1), r1=235(y1), r2=180(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 235
LDI r2, 180
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
