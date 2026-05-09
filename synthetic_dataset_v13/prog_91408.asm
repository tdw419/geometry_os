; DESCRIPTION: Places a cyan line segment connecting (181, 45) to (19, 66).
; PLAN: r0=181(x1), r1=45(y1), r2=19(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 45
LDI r2, 19
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
