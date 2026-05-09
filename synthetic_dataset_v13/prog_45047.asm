; DESCRIPTION: Composite: Places a black dot at position (31, 127) then Draws a cyan rectangle at (363, 141) with width 47 and height 53.
; PLAN: r0=31(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=141(y), r7=47(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 363
LDI r6, 141
LDI r7, 47
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
