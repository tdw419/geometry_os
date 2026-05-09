; DESCRIPTION: Composite: Sets a single cyan pixel at (209, 200) then Renders a orange line between points (431, 159) and (380, 143).
; PLAN: r0=209(x), r1=200(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=431(x1), r6=159(y1), r7=380(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 200
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 159
LDI r7, 380
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
