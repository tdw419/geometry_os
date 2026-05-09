; DESCRIPTION: Places a blue line segment connecting (44, 182) to (487, 224).
; PLAN: r0=44(x1), r1=182(y1), r2=487(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 182
LDI r2, 487
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
