; DESCRIPTION: Places a blue line segment connecting (180, 242) to (241, 130).
; PLAN: r0=180(x1), r1=242(y1), r2=241(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 242
LDI r2, 241
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
