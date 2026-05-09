; DESCRIPTION: Composite: Places a green dot at position (133, 139) then Places a cyan line segment connecting (24, 102) to (444, 99).
; PLAN: r0=133(x), r1=139(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=24(x1), r6=102(y1), r7=444(x2), r8=99(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 139
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 24
LDI r6, 102
LDI r7, 444
LDI r8, 99
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
