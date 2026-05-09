; DESCRIPTION: Composite: Sets a single black pixel at (360, 29) then Places a green line segment connecting (398, 62) to (282, 200).
; PLAN: r0=360(x), r1=29(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=398(x1), r6=62(y1), r7=282(x2), r8=200(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 29
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 398
LDI r6, 62
LDI r7, 282
LDI r8, 200
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
