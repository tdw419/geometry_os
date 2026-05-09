; DESCRIPTION: Composite: Sets a single orange pixel at (226, 32) then Places a red line segment connecting (51, 98) to (128, 21).
; PLAN: r0=226(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=51(x1), r6=98(y1), r7=128(x2), r8=21(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 51
LDI r6, 98
LDI r7, 128
LDI r8, 21
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
