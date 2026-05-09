; DESCRIPTION: Places a cyan line segment connecting (211, 164) to (334, 49).
; PLAN: r0=211(x1), r1=164(y1), r2=334(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 164
LDI r2, 334
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
