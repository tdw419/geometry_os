; DESCRIPTION: Places a cyan line segment connecting (393, 11) to (157, 61).
; PLAN: r0=393(x1), r1=11(y1), r2=157(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 11
LDI r2, 157
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
