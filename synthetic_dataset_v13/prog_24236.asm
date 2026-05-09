; DESCRIPTION: Composite: Places a white dot at position (354, 145) then Places a cyan line segment connecting (98, 252) to (455, 255).
; PLAN: r0=354(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=98(x1), r6=252(y1), r7=455(x2), r8=255(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 145
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 252
LDI r7, 455
LDI r8, 255
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
