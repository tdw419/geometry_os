; DESCRIPTION: Places a magenta line segment connecting (313, 38) to (286, 224).
; PLAN: r0=313(x1), r1=38(y1), r2=286(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 38
LDI r2, 286
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
