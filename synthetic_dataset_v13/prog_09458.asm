; DESCRIPTION: Places a cyan line segment connecting (71, 61) to (439, 139).
; PLAN: r0=71(x1), r1=61(y1), r2=439(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 61
LDI r2, 439
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
