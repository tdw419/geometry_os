; DESCRIPTION: Composite: Sets a single black pixel at (294, 176) then Draws a cyan line from (483, 129) to (381, 33).
; PLAN: r0=294(x), r1=176(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=129(y1), r7=381(x2), r8=33(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 176
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 483
LDI r6, 129
LDI r7, 381
LDI r8, 33
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
