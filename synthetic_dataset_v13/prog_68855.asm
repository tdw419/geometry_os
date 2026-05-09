; DESCRIPTION: Places a cyan line segment connecting (248, 84) to (494, 49).
; PLAN: r0=248(x1), r1=84(y1), r2=494(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 84
LDI r2, 494
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
