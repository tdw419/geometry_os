; DESCRIPTION: Places a blue line segment connecting (18, 12) to (25, 192).
; PLAN: r0=18(x1), r1=12(y1), r2=25(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 12
LDI r2, 25
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
