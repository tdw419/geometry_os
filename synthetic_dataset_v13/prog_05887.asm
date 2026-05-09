; DESCRIPTION: Places a yellow line segment connecting (126, 235) to (398, 252).
; PLAN: r0=126(x1), r1=235(y1), r2=398(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 235
LDI r2, 398
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
