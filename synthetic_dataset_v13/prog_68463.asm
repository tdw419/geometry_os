; DESCRIPTION: Composite: Places a yellow line segment connecting (137, 248) to (432, 153) then Places a white dot at position (384, 205).
; PLAN: r0=137(x1), r1=248(y1), r2=432(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=205(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 248
LDI r2, 432
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 205
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
