; DESCRIPTION: Places a cyan line segment connecting (61, 60) to (71, 94).
; PLAN: r0=61(x1), r1=60(y1), r2=71(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 60
LDI r2, 71
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
