; DESCRIPTION: Composite: Sets a single black pixel at (274, 255) then Places a yellow line segment connecting (170, 127) to (240, 23).
; PLAN: r0=274(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=170(x1), r6=127(y1), r7=240(x2), r8=23(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 170
LDI r6, 127
LDI r7, 240
LDI r8, 23
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
