; DESCRIPTION: Composite: Sets a single purple pixel at (376, 84) then Places a black line segment connecting (470, 228) to (127, 115).
; PLAN: r0=376(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=470(x1), r6=228(y1), r7=127(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 470
LDI r6, 228
LDI r7, 127
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
