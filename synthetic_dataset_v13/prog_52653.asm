; DESCRIPTION: Places a cyan line segment connecting (508, 57) to (492, 45).
; PLAN: r0=508(x1), r1=57(y1), r2=492(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 57
LDI r2, 492
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
