; DESCRIPTION: Composite: Places a cyan line segment connecting (119, 122) to (486, 212) then Renders a green disk with center (405, 115) and radius 26.
; PLAN: r0=119(x1), r1=122(y1), r2=486(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=115(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 119
LDI r1, 122
LDI r2, 486
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 115
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
