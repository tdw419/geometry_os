; DESCRIPTION: Places a cyan line segment connecting (289, 193) to (165, 119).
; PLAN: r0=289(x1), r1=193(y1), r2=165(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 193
LDI r2, 165
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
