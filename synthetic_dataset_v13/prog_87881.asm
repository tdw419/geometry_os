; DESCRIPTION: Places a yellow line segment connecting (43, 235) to (460, 35).
; PLAN: r0=43(x1), r1=235(y1), r2=460(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 235
LDI r2, 460
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
