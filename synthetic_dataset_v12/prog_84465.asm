; DESCRIPTION: Composite: Sets a single cyan pixel at (378, 40) then Places a magenta line segment connecting (502, 4) to (11, 69).
; PLAN: r0=378(x), r1=40(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=4(y1), r7=11(x2), r8=69(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 40
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 502
LDI r6, 4
LDI r7, 11
LDI r8, 69
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
