; DESCRIPTION: Composite: Places a purple dot at position (298, 103) then Places a red 26x105 rectangle at position (94, 54).
; PLAN: r0=298(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=54(y), r7=26(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 54
LDI r7, 26
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
