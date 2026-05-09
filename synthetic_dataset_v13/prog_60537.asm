; DESCRIPTION: Composite: Places a purple dot at position (297, 144) then Renders a purple box of size 98x25 starting at (112, 170).
; PLAN: r0=297(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=170(y), r7=98(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 170
LDI r7, 98
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
