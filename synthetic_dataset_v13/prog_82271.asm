; DESCRIPTION: Places a green line segment connecting (69, 137) to (225, 164).
; PLAN: r0=69(x1), r1=137(y1), r2=225(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 137
LDI r2, 225
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
