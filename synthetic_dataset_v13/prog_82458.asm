; DESCRIPTION: Composite: Sets a single red pixel at (180, 238) then Places a red line segment connecting (144, 108) to (26, 166).
; PLAN: r0=180(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=108(y1), r7=26(x2), r8=166(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 144
LDI r6, 108
LDI r7, 26
LDI r8, 166
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
