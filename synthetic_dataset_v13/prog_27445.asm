; DESCRIPTION: Places a cyan line segment connecting (143, 54) to (509, 77).
; PLAN: r0=143(x1), r1=54(y1), r2=509(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 54
LDI r2, 509
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
