; DESCRIPTION: Composite: Sets a single yellow pixel at (319, 19) then Places a blue 46x61 rectangle at position (2, 6).
; PLAN: r0=319(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=6(y), r7=46(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 2
LDI r6, 6
LDI r7, 46
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
