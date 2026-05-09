; DESCRIPTION: Places a cyan line segment connecting (274, 207) to (343, 12).
; PLAN: r0=274(x1), r1=207(y1), r2=343(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 207
LDI r2, 343
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
