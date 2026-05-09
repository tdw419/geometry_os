; DESCRIPTION: Places a blue line segment connecting (365, 196) to (233, 55).
; PLAN: r0=365(x1), r1=196(y1), r2=233(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 196
LDI r2, 233
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
