; DESCRIPTION: Composite: Sets a single black pixel at (422, 224) then Places a red line segment connecting (426, 63) to (24, 37).
; PLAN: r0=422(x), r1=224(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=426(x1), r6=63(y1), r7=24(x2), r8=37(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 224
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 426
LDI r6, 63
LDI r7, 24
LDI r8, 37
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
