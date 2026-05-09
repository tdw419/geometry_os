; DESCRIPTION: Composite: Places a cyan dot at position (441, 143) then Renders a white box of size 112x119 starting at (180, 27).
; PLAN: r0=441(x), r1=143(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=27(y), r7=112(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 143
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 27
LDI r7, 112
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
