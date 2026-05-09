; DESCRIPTION: Composite: Places a yellow dot at position (384, 26) then Places a green line segment connecting (53, 165) to (19, 149).
; PLAN: r0=384(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=53(x1), r6=165(y1), r7=19(x2), r8=149(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 53
LDI r6, 165
LDI r7, 19
LDI r8, 149
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
