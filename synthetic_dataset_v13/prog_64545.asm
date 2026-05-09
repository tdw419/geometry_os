; DESCRIPTION: Composite: Sets a single red pixel at (207, 249) then Places a green line segment connecting (170, 132) to (499, 93).
; PLAN: r0=207(x), r1=249(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=170(x1), r6=132(y1), r7=499(x2), r8=93(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 249
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 170
LDI r6, 132
LDI r7, 499
LDI r8, 93
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
