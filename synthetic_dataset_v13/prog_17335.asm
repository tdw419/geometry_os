; DESCRIPTION: Composite: Sets a single white pixel at (260, 211) then Places a green line segment connecting (385, 46) to (250, 46).
; PLAN: r0=260(x), r1=211(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=46(y1), r7=250(x2), r8=46(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 211
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 46
LDI r7, 250
LDI r8, 46
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
