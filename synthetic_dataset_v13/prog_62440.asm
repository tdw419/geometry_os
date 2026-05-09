; DESCRIPTION: Composite: Sets a single yellow pixel at (280, 219) then Places a cyan 114x61 rectangle at position (25, 116).
; PLAN: r0=280(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=116(y), r7=114(width), r8=61(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 25
LDI r6, 116
LDI r7, 114
LDI r8, 61
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
