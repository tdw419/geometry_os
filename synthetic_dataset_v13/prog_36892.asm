; DESCRIPTION: Composite: Places a cyan dot at position (334, 161) then Places a green line segment connecting (207, 32) to (496, 246).
; PLAN: r0=334(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=207(x1), r6=32(y1), r7=496(x2), r8=246(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 32
LDI r7, 496
LDI r8, 246
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
