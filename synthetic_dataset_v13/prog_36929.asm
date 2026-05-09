; DESCRIPTION: Composite: Places a black dot at position (58, 191) then Renders a yellow line between points (189, 167) and (397, 110).
; PLAN: r0=58(x), r1=191(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=167(y1), r7=397(x2), r8=110(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 191
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 189
LDI r6, 167
LDI r7, 397
LDI r8, 110
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
