; DESCRIPTION: Places a magenta line segment connecting (481, 83) to (253, 12).
; PLAN: r0=481(x1), r1=83(y1), r2=253(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 83
LDI r2, 253
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
