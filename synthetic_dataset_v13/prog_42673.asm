; DESCRIPTION: Composite: Places a cyan circle of radius 47 at center (141, 170) then Renders a cyan line between points (73, 147) and (69, 139).
; PLAN: r0=141(x), r1=170(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x1), r6=147(y1), r7=69(x2), r8=139(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 170
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 147
LDI r7, 69
LDI r8, 139
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
