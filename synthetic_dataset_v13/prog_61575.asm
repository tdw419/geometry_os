; DESCRIPTION: Composite: Sets a single cyan pixel at (341, 194) then Places a cyan line segment connecting (384, 151) to (205, 207).
; PLAN: r0=341(x), r1=194(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=384(x1), r6=151(y1), r7=205(x2), r8=207(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 194
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 151
LDI r7, 205
LDI r8, 207
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
