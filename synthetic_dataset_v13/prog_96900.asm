; DESCRIPTION: Composite: Places a green line segment connecting (137, 53) to (228, 150) then Sets a single green pixel at (275, 20).
; PLAN: r0=137(x1), r1=53(y1), r2=228(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 53
LDI r2, 228
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
