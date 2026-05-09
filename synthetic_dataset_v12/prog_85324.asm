; DESCRIPTION: Places a yellow line segment connecting (306, 230) to (235, 18).
; PLAN: r0=306(x1), r1=230(y1), r2=235(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 230
LDI r2, 235
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
