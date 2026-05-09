; DESCRIPTION: Composite: Places a purple dot at position (209, 107) then Places a green 20x117 rectangle at position (194, 37).
; PLAN: r0=209(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=37(y), r7=20(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 37
LDI r7, 20
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
