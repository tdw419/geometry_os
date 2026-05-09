; DESCRIPTION: Places a magenta line segment connecting (504, 230) to (235, 123).
; PLAN: r0=504(x1), r1=230(y1), r2=235(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 230
LDI r2, 235
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
