; DESCRIPTION: Composite: Sets a single purple pixel at (131, 203) then Places a cyan line segment connecting (196, 234) to (178, 36).
; PLAN: r0=131(x), r1=203(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=234(y1), r7=178(x2), r8=36(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 203
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 234
LDI r7, 178
LDI r8, 36
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
