; DESCRIPTION: Places a black line segment connecting (415, 193) to (69, 193).
; PLAN: r0=415(x1), r1=193(y1), r2=69(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 193
LDI r2, 69
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
