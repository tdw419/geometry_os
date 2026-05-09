; DESCRIPTION: Composite: Creates a green circular shape at (106, 122) with radius 75 then Places a green dot at position (398, 200).
; PLAN: r0=106(x), r1=122(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=200(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 122
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 200
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
