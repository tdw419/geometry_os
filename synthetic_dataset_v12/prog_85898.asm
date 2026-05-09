; DESCRIPTION: Places a magenta line segment connecting (303, 176) to (374, 153).
; PLAN: r0=303(x1), r1=176(y1), r2=374(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 176
LDI r2, 374
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
