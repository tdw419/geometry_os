; DESCRIPTION: Composite: Sets a single black pixel at (114, 171) then Places a green line segment connecting (37, 74) to (144, 108).
; PLAN: r0=114(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=37(x1), r6=74(y1), r7=144(x2), r8=108(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 37
LDI r6, 74
LDI r7, 144
LDI r8, 108
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
