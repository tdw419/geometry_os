; DESCRIPTION: Places a cyan line segment connecting (56, 233) to (478, 48).
; PLAN: r0=56(x1), r1=233(y1), r2=478(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 233
LDI r2, 478
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
