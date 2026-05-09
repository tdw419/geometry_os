; DESCRIPTION: Composite: Places a cyan line segment connecting (54, 162) to (174, 83) then Places a black dot at position (304, 20).
; PLAN: r0=54(x1), r1=162(y1), r2=174(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=20(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 162
LDI r2, 174
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 20
LDI r7, 0x000000
PSET r5, r6, r7
HALT
