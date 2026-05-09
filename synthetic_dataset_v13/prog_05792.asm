; DESCRIPTION: Composite: Places a cyan dot at position (153, 74) then Places a green line segment connecting (24, 88) to (444, 244).
; PLAN: r0=153(x), r1=74(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=24(x1), r6=88(y1), r7=444(x2), r8=244(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 74
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 88
LDI r7, 444
LDI r8, 244
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
