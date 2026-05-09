; DESCRIPTION: Places a black line segment connecting (280, 25) to (264, 153).
; PLAN: r0=280(x1), r1=25(y1), r2=264(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 25
LDI r2, 264
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
