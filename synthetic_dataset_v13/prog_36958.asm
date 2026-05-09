; DESCRIPTION: Places a cyan line segment connecting (399, 115) to (458, 60).
; PLAN: r0=399(x1), r1=115(y1), r2=458(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 115
LDI r2, 458
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
