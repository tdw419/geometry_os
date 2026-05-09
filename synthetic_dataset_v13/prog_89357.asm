; DESCRIPTION: Places a cyan line segment connecting (343, 223) to (157, 220).
; PLAN: r0=343(x1), r1=223(y1), r2=157(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 223
LDI r2, 157
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
