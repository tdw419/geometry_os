; DESCRIPTION: Places a yellow line segment connecting (235, 60) to (262, 192).
; PLAN: r0=235(x1), r1=60(y1), r2=262(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 60
LDI r2, 262
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
