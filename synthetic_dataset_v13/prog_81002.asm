; DESCRIPTION: Composite: Sets a single magenta pixel at (128, 236) then Places a purple 83x117 rectangle at position (228, 52).
; PLAN: r0=128(x), r1=236(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=52(y), r7=83(width), r8=117(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 236
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 228
LDI r6, 52
LDI r7, 83
LDI r8, 117
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
