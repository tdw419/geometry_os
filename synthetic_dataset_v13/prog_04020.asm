; DESCRIPTION: Places a red line segment connecting (465, 29) to (235, 201).
; PLAN: r0=465(x1), r1=29(y1), r2=235(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 29
LDI r2, 235
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
