; DESCRIPTION: Places a cyan line segment connecting (43, 140) to (341, 23).
; PLAN: r0=43(x1), r1=140(y1), r2=341(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 140
LDI r2, 341
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
