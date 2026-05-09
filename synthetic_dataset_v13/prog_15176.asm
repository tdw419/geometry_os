; DESCRIPTION: Composite: Sets a single purple pixel at (41, 216) then Places a magenta 56x32 rectangle at position (269, 22).
; PLAN: r0=41(x), r1=216(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=22(y), r7=56(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 216
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 22
LDI r7, 56
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
