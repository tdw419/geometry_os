; DESCRIPTION: Composite: Sets a single black pixel at (249, 146) then Places a orange 64x119 rectangle at position (384, 8).
; PLAN: r0=249(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=8(y), r7=64(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 384
LDI r6, 8
LDI r7, 64
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
