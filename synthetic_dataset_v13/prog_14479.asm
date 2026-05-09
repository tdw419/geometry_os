; DESCRIPTION: Composite: Places a yellow circle of radius 46 at center (335, 66) then Renders a green line between points (212, 225) and (98, 11).
; PLAN: r0=335(x), r1=66(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x1), r6=225(y1), r7=98(x2), r8=11(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 66
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 225
LDI r7, 98
LDI r8, 11
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
