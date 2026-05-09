; DESCRIPTION: Composite: Sets a single black pixel at (218, 24) then Places a cyan 83x64 rectangle at position (100, 100).
; PLAN: r0=218(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=100(y), r7=83(width), r8=64(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 100
LDI r6, 100
LDI r7, 83
LDI r8, 64
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
