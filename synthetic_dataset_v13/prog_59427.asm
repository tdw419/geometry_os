; DESCRIPTION: Composite: Sets a single black pixel at (455, 167) then Renders a cyan line between points (252, 43) and (140, 166).
; PLAN: r0=455(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=43(y1), r7=140(x2), r8=166(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 252
LDI r6, 43
LDI r7, 140
LDI r8, 166
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
