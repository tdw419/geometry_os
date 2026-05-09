; DESCRIPTION: Composite: Places a blue dot at position (147, 125) then Renders a purple box of size 97x20 starting at (189, 86).
; PLAN: r0=147(x), r1=125(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=86(y), r7=97(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 125
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 86
LDI r7, 97
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
