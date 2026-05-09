; DESCRIPTION: Places a black line segment connecting (456, 225) to (173, 80).
; PLAN: r0=456(x1), r1=225(y1), r2=173(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 225
LDI r2, 173
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
