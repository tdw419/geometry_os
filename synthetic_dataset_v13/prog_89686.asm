; DESCRIPTION: Composite: Places a white line segment connecting (313, 172) to (13, 9) then Places a black dot at position (168, 77).
; PLAN: r0=313(x1), r1=172(y1), r2=13(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=77(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 172
LDI r2, 13
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 77
LDI r7, 0x000000
PSET r5, r6, r7
HALT
