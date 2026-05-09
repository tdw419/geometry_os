; DESCRIPTION: Composite: Sets a single purple pixel at (386, 101) then Places a green 83x99 rectangle at position (366, 88).
; PLAN: r0=386(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=88(y), r7=83(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 366
LDI r6, 88
LDI r7, 83
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
