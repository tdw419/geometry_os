; DESCRIPTION: Composite: Places a black dot at position (275, 206) then Places a magenta 32x89 rectangle at position (342, 97).
; PLAN: r0=275(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=97(y), r7=32(width), r8=89(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 342
LDI r6, 97
LDI r7, 32
LDI r8, 89
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
