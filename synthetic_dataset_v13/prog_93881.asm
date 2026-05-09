; DESCRIPTION: Composite: Places a black dot at position (299, 246) then Renders a yellow line between points (445, 185) and (228, 23).
; PLAN: r0=299(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=185(y1), r7=228(x2), r8=23(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 445
LDI r6, 185
LDI r7, 228
LDI r8, 23
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
