; DESCRIPTION: Composite: Sets a single black pixel at (495, 240) then Places a white line segment connecting (462, 68) to (243, 36).
; PLAN: r0=495(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=462(x1), r6=68(y1), r7=243(x2), r8=36(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 462
LDI r6, 68
LDI r7, 243
LDI r8, 36
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
