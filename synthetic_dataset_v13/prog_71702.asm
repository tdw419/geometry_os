; DESCRIPTION: Composite: Sets a single blue pixel at (18, 45) then Places a yellow 72x16 rectangle at position (109, 28).
; PLAN: r0=18(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=28(y), r7=72(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 45
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 28
LDI r7, 72
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
