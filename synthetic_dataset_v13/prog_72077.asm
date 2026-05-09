; DESCRIPTION: Places a black line segment connecting (225, 247) to (415, 0).
; PLAN: r0=225(x1), r1=247(y1), r2=415(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 247
LDI r2, 415
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
