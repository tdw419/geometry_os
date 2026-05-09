; DESCRIPTION: Places a blue line segment connecting (67, 137) to (439, 210).
; PLAN: r0=67(x1), r1=137(y1), r2=439(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 137
LDI r2, 439
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
