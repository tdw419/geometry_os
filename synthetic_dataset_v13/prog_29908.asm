; DESCRIPTION: Composite: Places a yellow dot at position (120, 54) then Places a green line segment connecting (467, 192) to (344, 217).
; PLAN: r0=120(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=467(x1), r6=192(y1), r7=344(x2), r8=217(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 467
LDI r6, 192
LDI r7, 344
LDI r8, 217
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
