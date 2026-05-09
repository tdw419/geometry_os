; DESCRIPTION: Composite: Sets a single blue pixel at (260, 141) then Places a cyan 28x119 rectangle at position (101, 94).
; PLAN: r0=260(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=94(y), r7=28(width), r8=119(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 101
LDI r6, 94
LDI r7, 28
LDI r8, 119
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
