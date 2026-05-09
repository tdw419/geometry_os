; DESCRIPTION: Composite: Sets a single black pixel at (9, 87) then Renders a purple box of size 12x25 starting at (148, 204).
; PLAN: r0=9(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=204(y), r7=12(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 9
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 148
LDI r6, 204
LDI r7, 12
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
