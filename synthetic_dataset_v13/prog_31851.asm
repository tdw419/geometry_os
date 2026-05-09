; DESCRIPTION: Composite: Places a purple dot at position (328, 208) then Places a red circle of radius 12 at center (390, 68).
; PLAN: r0=328(x), r1=208(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=68(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 208
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 390
LDI r6, 68
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
