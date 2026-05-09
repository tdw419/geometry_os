; DESCRIPTION: Composite: Places a orange line segment connecting (341, 9) to (199, 146) then Places a black dot at position (480, 227).
; PLAN: r0=341(x1), r1=9(y1), r2=199(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=227(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 9
LDI r2, 199
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 227
LDI r7, 0x000000
PSET r5, r6, r7
HALT
