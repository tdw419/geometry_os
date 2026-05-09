; DESCRIPTION: Places a yellow line segment connecting (345, 235) to (190, 55).
; PLAN: r0=345(x1), r1=235(y1), r2=190(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 235
LDI r2, 190
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
