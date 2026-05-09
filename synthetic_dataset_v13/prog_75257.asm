; DESCRIPTION: Composite: Places a white dot at position (251, 4) then Draws a cyan line from (226, 116) to (419, 128).
; PLAN: r0=251(x), r1=4(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=226(x1), r6=116(y1), r7=419(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 4
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 116
LDI r7, 419
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
