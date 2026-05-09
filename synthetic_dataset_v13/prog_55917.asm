; DESCRIPTION: Composite: Sets a single black pixel at (64, 38) then Places a black line segment connecting (127, 235) to (460, 42).
; PLAN: r0=64(x), r1=38(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=235(y1), r7=460(x2), r8=42(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 38
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 127
LDI r6, 235
LDI r7, 460
LDI r8, 42
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
